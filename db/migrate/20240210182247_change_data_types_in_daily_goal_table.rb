class ChangeDataTypesInDailyGoalTable < ActiveRecord::Migration[7.1]
  def change
    change_column :daily_goals, :calorie_goal, :decimal, precision: 10, scale: 2
    change_column :daily_goals, :protein_goal, :decimal, precision: 10, scale: 2
    change_column :daily_goals, :fat_goal, :decimal, precision: 10, scale: 2
    change_column :daily_goals, :carbs_goal, :decimal, precision: 10, scale: 2
    change_column :daily_goals, :sugar_goal, :decimal, precision: 10, scale: 2
  end
end
