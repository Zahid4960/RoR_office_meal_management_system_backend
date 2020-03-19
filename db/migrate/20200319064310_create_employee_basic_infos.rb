class CreateEmployeeBasicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_basic_infos do |t|

      # t.string :first_name, 
      t.timestamps
    end
  end
end
