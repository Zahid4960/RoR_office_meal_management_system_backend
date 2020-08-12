class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :emp_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: true
      t.date :dop, null: false
      t.integer :gender, null: false, comment: '1 => male, 2 => female, 3 => others'
      t.text :present_address, null: false
      t.text :permanent_address, null: false
      t.string :contact_no, null: false
      t.text :education, null: false
      t.date :joining_date, null: false
      t.references :office, index: true
      t.references :user, index: true
      t.references :designation, index: true
      t.references :department, index: true
      t.timestamps
    end
    add_foreign_key :user_infos, :offices, on_delete: :cascade
    add_foreign_key :user_infos, :users, on_delete: :cascade
    add_foreign_key :user_infos, :designations, on_delete: :cascade
    add_foreign_key :user_infos, :departments, on_delete: :cascade
  end
end
