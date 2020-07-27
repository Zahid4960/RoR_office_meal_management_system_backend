class CreateDesignations < ActiveRecord::Migration[5.2]
  def change
    create_table :designations do |t|

      t.string :designation_name, null: false
      t.boolean :active, default: 0
      t.timestamps
    end
  end
end
