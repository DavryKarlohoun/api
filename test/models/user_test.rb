require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test "net_meows is accurate AF" do
    assert_equal -1, @user.net_meows
  end
end
