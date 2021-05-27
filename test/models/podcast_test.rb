require "test_helper"

class PodcastTest < ActiveSupport::TestCase
  test "valid podcast" do
    pcast = podcasts(:horror_show)
    assert pcast.valid?
  end
end
