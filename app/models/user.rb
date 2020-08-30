class User < ApplicationRecord
  # regular expression for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validations
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :user_name, presence: true,  uniqueness: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6}

end
