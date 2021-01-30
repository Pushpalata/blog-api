class Comment < ApplicationRecord
  belongs_to :post

  # validations
  validates_presence_of :comment_text
end
