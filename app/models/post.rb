class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
	
	# validations
  validates_presence_of :title, :body
end
