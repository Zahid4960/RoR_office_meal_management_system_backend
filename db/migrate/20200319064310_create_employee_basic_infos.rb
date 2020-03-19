class CreateEmployeeBasicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_basic_infos do |t|

      t.string :first_name, null: false
      t.string :middle_name, null: true
      t.string :last_name, null: true
      t.boolean :sex, null: false
      t.string :dop, null: false
      t.string :nid, null: false
      t.string :father_name, null: false
      t.string :mother_name, null: false
      t.text :present_address, null: false
      t.text :permanent_address, null: false
      t.boolean :status, null: true
      t.timestamps
    end
  end
end
