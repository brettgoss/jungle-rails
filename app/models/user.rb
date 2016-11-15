class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 2}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
end
