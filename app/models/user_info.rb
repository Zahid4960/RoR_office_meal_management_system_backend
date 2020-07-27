class UserInfo < ApplicationRecord
  belongs_to :user
  has_one :department
  has_one :designation
  has_one :Office
end
