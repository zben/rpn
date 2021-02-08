class InsufficientParameters < StandardError
  def initialize(token)
    @token = token
  end

  def to_s
    "operator #{@token}: insufficient parameters"
  end
end