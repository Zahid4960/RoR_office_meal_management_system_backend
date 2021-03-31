class CreateMealSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_settings do |t|
      t.time :last_input_time, null: false
      t.float :per_meal_price, null: false
      t.references :office, index: true
      t.boolean :active, default: 1
      t.timestamps
    end
    add_foreign_key :meal_settings, :offices, on_update: :cascade, on_delete: :cascade
  end
end
