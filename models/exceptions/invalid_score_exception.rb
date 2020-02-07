class InvalidScoreException < RuntimeError
  def initialize(msg = 'Invalid score value or incorrect score format')
    super
  end
end
