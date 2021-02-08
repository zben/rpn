require "test_helper"

class SubtractionTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_processing_two_numbers
    @rpn.process('1 3')
    Subtraction.new(@rpn).process
    assert_equal @rpn.to_s, "stack: -2"
  end

  def test_processing_only_one_number
    @rpn.process('1')
    
    assert_raises InsufficientParameters do
      Subtraction.new(@rpn).process
    end

    assert_equal @rpn.to_s, "stack: 1"
  end
end