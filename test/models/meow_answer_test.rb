require 'test_helper'

class MeowAnswerTest < ActiveSupport::TestCase
  setup do
    @answer = answers(:two)
  end

  test "net_meows is accurate AF" do
    assert_equal 1, @answer.net_meows
  end
end
