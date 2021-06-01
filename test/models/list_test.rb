require "test_helper"

class ListTest < ActiveSupport::TestCase
  test "valid list" do
    list = lists(:best_pods)
    assert list.valid?
  end
end
