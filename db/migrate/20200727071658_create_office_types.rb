class CreateOfficeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :office_types do |t|
      t.string :type, null: false
      t.boolean :active, default: 1
      t.timestamps
    end
  end
end
