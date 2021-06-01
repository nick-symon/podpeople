require "test_helper"

class ListJoinTest < ActiveSupport::TestCase
  test "valid list join" do
    list_join = list_joins(:best_pods_join)
    assert list_join.valid?
  end
end
