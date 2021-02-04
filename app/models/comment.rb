class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  # validations
  validates_presence_of :comment_text, :user_id
end
