class Day < ApplicationRecord

  self.table_name = "days"

  validates :day, presence: true, uniqueness: true

end
