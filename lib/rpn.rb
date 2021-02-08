#require "rpn/version"

require_relative 'errors/invalid_parameters'
require_relative 'errors/insufficient_parameters'

require_relative 'operations/addition'
require_relative 'operations/subtraction'
require_relative 'operations/multiplication'
require_relative 'operations/division'
require_relative 'operations/clear'
require_relative 'operations/undo'
require_relative 'operations/square_root'

class Rpn
  SUPPORTED_OPERATION_CLASSES = [
    Addition,
    Subtraction,
    Multiplication,
    Division,
    SquareRoot,
    Undo,
    Clear
  ] 

  def initialize
    @stack_histories = [[]]
  end

  def stack_histories
    @stack_histories
  end

  def current_stack
    @stack_histories[-1]
  end

  def clear
    @stack_histories = [[]]
  end

  def to_s
    formatted_current_stack = current_stack.map do |num|
      if num == num.to_i
        num.to_i.to_s
      else
        ('%.10f' % num.floor(10)).sub(/0+$/, '')
      end
    end

    "stack: #{formatted_current_stack.join(' ')}"
  end

  def process(input)
    input.split(' ').each do |token|
      if operation_klass = operation_map[token]
        operation_klass.new(self).process
      else
        new_stack = current_stack.clone << (token =~ /^[0-9]+$/ ? token.to_i : token.to_f)
        @stack_histories << new_stack
      end   
    end
  rescue InsufficientParameters, InvalidParameters => e
    puts e
  end

  private

  def operation_map
    @operation_map ||= SUPPORTED_OPERATION_CLASSES.inject({}) do |map, operation_class|
      map[operation_class::SYMBOL] = operation_class
      map
    end
  end
end