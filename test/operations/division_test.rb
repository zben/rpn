require "test_helper"

class DivisionTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_processing_two_numbers
    @rpn.process('2 5')
    Division.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 0.4"
  end

  def test_processing_only_one_number
    @rpn.process('1')
    
    assert_raises InsufficientParameters do
      Division.new(@rpn).process
    end

    assert_equal @rpn.to_s, "stack: 1"
  end

  def test_processing_division_by_zero
    @rpn.process('1 0')
    
    assert_raises InvalidParameters do
      Division.new(@rpn).process
    end

    assert_equal @rpn.to_s, "stack: 1 0"
  end

  def test_for_10_decimal_places_precission
    @rpn.process('1 7')
    Division.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 0.1428571428"
  end
end