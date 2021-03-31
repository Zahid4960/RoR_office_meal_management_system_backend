class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :department_name, null: false
      t.references :office, index: true
      t.boolean :active, default: 1
      t.timestamps
    end
    add_foreign_key :departments, :offices, on_update: :cascade, on_delete: :cascade
  end
end
