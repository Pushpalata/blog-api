require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:post) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:comment_text) }
end
