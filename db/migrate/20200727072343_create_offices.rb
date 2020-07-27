class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|

      t.string :office_name, null: false
      t.text :office_address, null: false
      t.text :office_contact, null: false
      t.integer :office_type_id, null: false
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
