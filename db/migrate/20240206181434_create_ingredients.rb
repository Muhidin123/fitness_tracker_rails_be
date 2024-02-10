class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :calories
      t.decimal :protein
      t.decimal :fat
      t.decimal :carbs
      t.decimal :sugar

      t.timestamps
    end
  end
end
