require "test_helper"

class MultiplicationTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_processing_two_numbers
    @rpn.process('2 3')
    Multiplication.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 6"
  end

  def test_processing_only_one_number
    @rpn.process('1')
    
    assert_raises InsufficientParameters do
      Multiplication.new(@rpn).process
    end

    assert_equal @rpn.to_s, "stack: 1"
  end
end