require_relative 'operation'

class Undo < Operation
  SYMBOL = 'undo'.freeze

  def process
    stack_histories.pop unless stack_histories == [[]]
  end
end