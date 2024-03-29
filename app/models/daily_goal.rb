# == Schema Information
#
# Table name: daily_goals
#
#  id           :bigint           not null, primary key
#  calorie_goal :integer
#  protein_goal :integer
#  fat_goal     :integer
#  carbs_goal   :integer
#  sugar_goal   :integer
#  account_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class DailyGoal < ApplicationRecord
  belongs_to :account

  validates :date, presence: true, uniqueness: { scope: :account_id }
  validates :calorie_goal, :protein_goal, :fat_goal, :carbs_goal, :sugar_goal, presence: true
  validates :calorie_goal, :protein_goal, :fat_goal, :carbs_goal, :sugar_goal, numericality: { only_decimal: true, greater_than: 0 }
end
