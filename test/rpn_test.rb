require "test_helper"

class RpnTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_inputting_just_numbers
    @rpn.process('5 2')
    assert_equal @rpn.to_s, "stack: 5 2"
  end

  def test_square_root_clear
    @rpn.process('2 sqrt')
    assert_equal @rpn.to_s, "stack: 1.4142135623"

    @rpn.process('clear 9 sqrt')
    assert_equal @rpn.to_s, "stack: 3"
  end

  def test_subtraction_and_clear
    @rpn.process('5 2 -')
    assert_equal @rpn.to_s, "stack: 3"

    @rpn.process('3 -')
    assert_equal @rpn.to_s, "stack: 0"

    @rpn.process('clear')
    assert_equal @rpn.to_s, "stack: "
  end

  def test_undo_multiplication
    @rpn.process('5 4 3 2')
    assert_equal @rpn.to_s, "stack: 5 4 3 2"

    @rpn.process('undo undo *')
    assert_equal @rpn.to_s, "stack: 20"

    @rpn.process('5 *')
    assert_equal @rpn.to_s, "stack: 100"

    @rpn.process('undo')
    assert_equal @rpn.to_s, "stack: 20 5"
  end

  def test_division_multiplication
    @rpn.process('7 12 2 /')
    assert_equal @rpn.to_s, "stack: 7 6"

    @rpn.process('*')
    assert_equal @rpn.to_s, "stack: 42"

    @rpn.process('4 /')
    assert_equal @rpn.to_s, "stack: 10.5"
  end

  def test_multiplication_clear_subtraction
    @rpn.process('1 2 3 4 5')
    assert_equal @rpn.to_s, "stack: 1 2 3 4 5"

    @rpn.process('*')
    assert_equal @rpn.to_s, "stack: 1 2 3 20"

    @rpn.process('clear 3 4 -')
    assert_equal @rpn.to_s, "stack: -1"
  end

  def test_consecutive_multiplications
    @rpn.process('1 2 3 4 5')
    assert_equal @rpn.to_s, "stack: 1 2 3 4 5"

    @rpn.process('* * * *')
    assert_equal @rpn.to_s, "stack: 120"
  end

  def test_insufficient_parameters
    assert_output("operator *: insufficient parameters\n") do
      @rpn.process('1 2 3 * 5 + * * 6 5')
    end
    assert_equal @rpn.to_s, "stack: 11"
  end

  def test_invalid_parameters
    assert_output("operator /: invalid parameters\n") do
      @rpn.process('1 0 / 3 3')
    end
    assert_equal @rpn.to_s, "stack: 1 0"
  end
end
