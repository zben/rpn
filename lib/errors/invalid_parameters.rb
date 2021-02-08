class InvalidParameters < StandardError
  def initialize(token)
    @token = token
  end

  def to_s
    "operator #{@token}: invalid parameters"
  end
end