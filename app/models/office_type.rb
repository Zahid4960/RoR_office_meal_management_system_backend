class OfficeType < ApplicationRecord
  validates :type_name, presence: true
end
