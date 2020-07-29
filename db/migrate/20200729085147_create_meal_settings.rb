class CreateMealSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_settings do |t|

      t.time :last_input_time, null: false
      t.integer :office_id, null: false, index: true
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
