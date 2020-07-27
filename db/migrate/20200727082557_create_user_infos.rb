class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|

      t.string :emp_id, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.date :dop, null: false
      t.integer :gender, null: false
      t.text :present_address, null: false
      t.text :permanent_address, null: false
      t.string :contact, null: false
      t.text :education, null: false
      t.date :joining_date, null: false
      t.integer :office_id, null: false
      t.integer :designation_id, null: false
      t.integer :department_id, null: false
      t.timestamps
    end
  end
end
