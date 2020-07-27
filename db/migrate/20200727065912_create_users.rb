class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :email, null: false
      t.string :user_name, null: false
      t.string :password, null: false
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end