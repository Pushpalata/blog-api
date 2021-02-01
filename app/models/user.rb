class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :posts
  has_many :comments
  has_many :likes
  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
