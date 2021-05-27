require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "valid review" do
    review = reviews(:good)
    assert review.valid? 
  end
end
