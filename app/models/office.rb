class Office < ApplicationRecord
  has_one :office_type, dependent: :destroy
  belong_to :user_info
  has_many :off_days
  has_many :meal_setting, dependent: :destroy
end
