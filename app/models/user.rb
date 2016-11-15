class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 2 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private

  def self.authenticate_with_credentials(email, password)
    email = email.strip

    if user = User.where('email = ?', email.downcase).first
      if user.authenticate(password)
        user
      end
    end
  end

end
