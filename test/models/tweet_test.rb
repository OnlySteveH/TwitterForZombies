require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:zombie)
  should validate_length_of(:status).is_at_most(140)
end
