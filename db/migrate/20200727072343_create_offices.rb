class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :office_name, null: false
      t.text :office_address, null: false
      t.text :office_contact, null: false
      t.references :office_type, index: true
      t.boolean :active, default: 1
      t.timestamps
    end
      add_foreign_key :offices, :office_types, on_update: :cascade, on_delete: :cascade
  end
end
