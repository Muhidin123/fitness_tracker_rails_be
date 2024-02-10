class CreateDailyGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_goals do |t|
      t.integer :calorie_goal
      t.integer :protein_goal
      t.integer :fat_goal
      t.integer :carbs_goal
      t.integer :sugar_goal
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
