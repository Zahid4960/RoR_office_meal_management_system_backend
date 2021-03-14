class Department < ApplicationRecord

  self.table_name = "departments"

  belongs_to :office

  validates :department_name, presence: true
  validates :office_id, presence: true

  scope :active, -> { where(active: 1)}
end
