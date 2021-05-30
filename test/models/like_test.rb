require "test_helper"

class LikeTest < ActiveSupport::TestCase
  test "valid like" do
    like = likes(:one)
    assert like.valid?
  end
end
