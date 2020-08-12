class CreateDesignations < ActiveRecord::Migration[5.2]
  def change
    create_table :designations do |t|
      t.string :designation_name, null: false
      t.references :office, index: true
      t.boolean :active, default: 1
      t.timestamps
    end
    add_foreign_key :designations, :offices, on_delete: :cascade
  end
end
