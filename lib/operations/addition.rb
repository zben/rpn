require_relative 'operation'

class Addition < Operation
  SYMBOL = '+'.freeze

  def process
    num1 = cloned_stack.pop
    num2 = cloned_stack.pop
    raise InsufficientParameters.new(SYMBOL) unless num1 and num2 
    stack_histories << (cloned_stack << (num1 + num2))
  end
end