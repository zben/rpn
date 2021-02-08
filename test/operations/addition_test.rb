require "test_helper"

class AdditionTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_processing_two_numbers
    @rpn.process('1 3')
    Addition.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 4"
  end

  def test_processing_only_one_number
    @rpn.process('1')

    assert_raises InsufficientParameters do
      Addition.new(@rpn).process
    end

    assert_equal @rpn.to_s, "stack: 1"
  end
end