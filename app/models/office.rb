class Office < ApplicationRecord
  validates :office_name, presence: true
  validates :office_address, presence: true
  validates :office_contact, presence: true
  validates :office_type_id, presence: true
end
