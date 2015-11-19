class User < ActiveRecord::Base

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  has_secure_password

  has_many :items
  has_many :txns
  # Added 1 to many relationship, user and comments
  has_many :comments

  def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
  end
  
end