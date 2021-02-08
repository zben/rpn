require_relative 'operation'

class Division < Operation
  SYMBOL = '/'.freeze

  def process
    num1 = cloned_stack.pop.to_f
    num2 = cloned_stack.pop
    raise InsufficientParameters.new(SYMBOL) unless num1 and num2 
    raise InvalidParameters.new(SYMBOL) if num1 == 0
    stack_histories << (cloned_stack << (num2 / num1))
  end
end