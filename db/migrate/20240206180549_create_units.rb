class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.integer :unit_type

      t.timestamps
    end
  end
end
