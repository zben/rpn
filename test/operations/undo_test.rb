require "test_helper"

class UndoTest < Minitest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_undoing_multiple_steps
    @rpn.process('1 3 5')
    Addition.new(@rpn).process
    Addition.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 9"

    Undo.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 1 8"

    Undo.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 1 3 5"

    Undo.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 1 3"


    Undo.new(@rpn).process
    assert_equal @rpn.to_s, "stack: 1"


    Undo.new(@rpn).process
    assert_equal @rpn.to_s, "stack: "


    Undo.new(@rpn).process
    assert_equal @rpn.to_s, "stack: "
  end
end