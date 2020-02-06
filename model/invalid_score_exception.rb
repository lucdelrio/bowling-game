# frozen_string_literal: true

class InvalidScoreException < RuntimeError
  def initialize(msg = 'Invalid score value or incorrect score format')
    super
  end
end
