# frozen_string_literal: true

class FrameLimitException < RuntimeError
  def initialize(msg = 'Frame limit reached')
    super
  end
end
