class OfficeType < ApplicationRecord
  # validations
  validates :type_name, presence: true
end
