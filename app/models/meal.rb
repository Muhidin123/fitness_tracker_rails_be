# == Schema Information
#
# Table name: meals
#
#  id         :bigint           not null, primary key
#  name       :integer
#  meal_date  :datetime
#  account_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Meal < ApplicationRecord
  belongs_to :account

  enum name: { breakfast: 0, lunch: 1, dinner: 2, snack: 3 }

  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients

  after_save do
    UpdateDailyGoalValues.perform_async(id)
  end

  def update_daily_goal
    daily_goal = Account.find(account_id).daily_goals.find_by!(date: meal_date)

    sums = ingredients.group(:id).select('SUM(calories) AS total_calories', 'SUM(protein) AS total_protein', 'SUM(carbs) AS total_carbs', 'SUM(fat) AS total_fat').first

    # Calculate the new goals by subtracting the sums from the daily goals
    calorie_goal = daily_goal.calorie_goal - sums.total_calories
    protein_goal = daily_goal.protein_goal - sums.total_protein
    carbs_goal = daily_goal.carbs_goal - sums.total_carbs
    fat_goal = daily_goal.fat_goal - sums.total_fat

    # Update the daily_goal with the new values
    daily_goal.update!(
      calorie_goal:,
      protein_goal:,
      carbs_goal:,
      fat_goal:
    )
  rescue ActiveRecord::RecordNotFound
    # Handle case where daily_goal is not found
  end
end
