require_relative 'operation'

class Multiplication < Operation
  SYMBOL = '*'.freeze

  def process
    num1 = cloned_stack.pop
    num2 = cloned_stack.pop
    raise InsufficientParameters.new(SYMBOL) unless num1 and num2 
    stack_histories << (cloned_stack << (num2 * num1))
  end
end