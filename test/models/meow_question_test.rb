require 'test_helper'

class MeowQuestionTest < ActiveSupport::TestCase
  setup do
    @question = questions(:one)
  end

  test "net_meows is accurate AF" do
    assert_equal 1, @question.net_meows
  end
end
