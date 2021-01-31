require 'rails_helper'

RSpec.describe Like, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:post_id) }
end
