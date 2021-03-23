class OfficeType < ApplicationRecord
  self.table_name = "office_types"
  validates :type_name, presence: true, uniqueness: true
end
