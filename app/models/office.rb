class Office < ApplicationRecord
  has_one :office_type, dependent: :destroy
end
