class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|

      t.integer :user_id, null: false, index: true
      t.integer :meal_count, null: false
      t.datetime :date, null: false
      t.integer :office_id, null: false, index: true
      t.integer :off_day_id, null: false, index: true
      t.integer :meal_setting_id, null: false, index: true
      t.timestamps
    end
  end
end
