class Operation
  def initialize(calculator)
    @calculator = calculator
  end

  def stack_histories
    @calculator.stack_histories
  end

  def cloned_stack
    @cloned_stack ||= @calculator.current_stack.clone
  end

  def process
    NotImplementedError
  end
end