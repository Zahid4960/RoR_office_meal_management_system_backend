class CreateOffDays < ActiveRecord::Migration[5.2]
  def change
    create_table :off_days do |t|
      t.references :day, index: true
      t.references :office, index: true
      t.boolean :active, default: 1
      t.timestamps
    end
    add_foreign_key :off_days, :days, on_update: :cascade, on_delete: :cascade
    add_foreign_key :off_days, :offices, on_update: :cascade, on_delete: :cascade
  end
end
