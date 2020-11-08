class Designation < ApplicationRecord

  self.table_name = 'designations'

  validates :designation_name, presence: true
  validates :office_id, presence: true
end
