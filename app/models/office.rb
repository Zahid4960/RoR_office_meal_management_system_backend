class Office < ApplicationRecord
  has_one :office_type, dependent: :destroy
  belong_to :user_info
  has_many :off_days
end
