class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.integer :name
      t.datetime :meal_date
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
