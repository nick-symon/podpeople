require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  test "valid profile" do
    profile = profiles(:fancy_jack)
    assert profile.valid?
  end
end
