require "test_helper"

class EpisodeTest < ActiveSupport::TestCase
  test "valid episode" do
    e = episodes(:scriptnotes_episode)  
    # byebug
    assert e.valid?
  end
end
