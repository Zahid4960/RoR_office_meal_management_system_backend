class CreateOffDays < ActiveRecord::Migration[5.2]
  def change
    create_table :off_days do |t|

      t.integer :day_id, null: false, index: true
      t.integer :office_id, null: false, index: true
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
