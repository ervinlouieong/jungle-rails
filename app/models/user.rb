class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, pw)
    user = User.find_by_email(email.strip.downcase)
    user && user.authenticate(pw) ? user : nil
  end
end
