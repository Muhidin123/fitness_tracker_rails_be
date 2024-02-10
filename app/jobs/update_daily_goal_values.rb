# Updates the daily goal values for a meal.
#
# @param meal_id [Integer] the ID of the meal to update
class UpdateDailyGoalValues
  include Sidekiq::Job

  sidekiq_options queue: :meals, retry: 3

  def perform(meal_id)
    Meal.find(meal_id).update_daily_goal
  end
end
