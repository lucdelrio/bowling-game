class RollLimitException < RuntimeError
  def initialize(msg = 'Roll limit reached')
    super
  end
end
