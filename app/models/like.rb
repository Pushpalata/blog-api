class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  # validations
  validates_presence_of :user_id, :post_id
  validates :user_id, uniqueness: { scope: :post_id,
    message: "You have already liked." }
end
