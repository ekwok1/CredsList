class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :items
  has_many :txns

  def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
  end
  
end