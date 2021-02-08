require "test_helper"

class ClearTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_clearing_of_calculator
    @rpn.process('1 3')
    Clear.new(@rpn).process
    assert_equal @rpn.to_s, "stack: "
  end
end