class Department < ApplicationRecord

  self.table_name = "departments"

  belongs_to :office

  validates :department_name, presence: true
  validates :office_id, presence: true
end
