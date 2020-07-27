class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      
      t.string :department_name, null: false
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
