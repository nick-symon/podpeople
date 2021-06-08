require "test_helper"

class EpisodeTest < ActiveSupport::TestCase
  test "valid episode" do
    e = episodes(:scriptnotes_episode)  
    assert e.valid?
  end
end
