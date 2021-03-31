class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.references :user_id, index: true
      t.float :meal_count, null: false
      t.datetime :date, null: false
      t.references :office, index: true
      t.timestamps
    end
    add_foreign_key :meals, :offices, on_update: :cascade, on_delete: :cascade
  end
end
