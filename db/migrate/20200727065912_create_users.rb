class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :plain_password, null: false
      t.boolean :is_admin, default: 1
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
