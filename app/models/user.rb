class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :posts
  has_many :comments
  # Validations
  validates_presence_of :name, :email, :password_digest
end
