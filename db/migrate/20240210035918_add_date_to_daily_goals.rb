class AddDateToDailyGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_goals, :date, :date, null: false, default: -> { 'CURRENT_DATE' }
  end
end
