class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
	
	# validations
  validates_presence_of :title, :body
end
