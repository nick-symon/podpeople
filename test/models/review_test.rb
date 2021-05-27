require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "valid review" do
    review = reviews(:good)
    assert review.valid? 
  end

  test "ratings must be within range" do
    review = reviews(:good)
    review.rating = 6
    assert review.invalid?
  end
end
