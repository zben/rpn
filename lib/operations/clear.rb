require_relative 'operation'

class Clear < Operation
  SYMBOL = 'clear'.freeze

  def process
    @calculator.clear
  end
end