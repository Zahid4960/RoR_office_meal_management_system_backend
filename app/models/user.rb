class User < ApplicationRecord
  # regular expression for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # email -> lowercase before save
  before_save { self.email = email.downcase }

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :user_name, presence: true,  uniqueness: true
  validates :password, presence: true, length: { minimum: 6}
end
