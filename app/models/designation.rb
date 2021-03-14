class Designation < ApplicationRecord

  self.table_name = 'designations'

  belongs_to :office

  validates :designation_name, presence: true
  validates :office_id, presence: true

  scope :active, ->{ where(active: 1) }
end
