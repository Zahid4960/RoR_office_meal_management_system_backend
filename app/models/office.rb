class Office < ApplicationRecord

  self.table_name = 'offices'

  has_one :office_type, class_name: "OfficeType", foreign_key: "id", primary_key: "office_type_id"
  has_many :departments

  validates :office_name, presence: true
  validates :office_address, presence: true
  validates :office_contact, presence: true
  validates :office_type_id, presence: true

  scope :active, -> { where(active: 1)}
end
