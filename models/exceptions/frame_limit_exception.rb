class FrameLimitException < RuntimeError
  def initialize(msg = 'Frame limit reached')
    super
  end
end
