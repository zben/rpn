require_relative 'operation'

class SquareRoot < Operation
  SYMBOL = 'sqrt'.freeze

  def process
    num = cloned_stack.pop
    raise InsufficientParameters.new(SYMBOL) unless num 
    raise InvalidParameters.new(SYMBOL) if num < 0 
    stack_histories << (cloned_stack << Math.sqrt(num))
  end
end