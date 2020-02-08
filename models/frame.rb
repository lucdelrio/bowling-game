class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def add_pinfall(pins)
    # Throw exception if pins != F or if pins is not between 0 and 10
    raise InvalidScoreException if !pins.match?(/F/) && !(0..10).cover?(pins.to_i)

    @rolls << pins.to_i
  end

  def strike?
    rolls.length == 1 && score == 10
  end

  def complete?
    rolls.length == 2 || strike?
  end

  def score
    rolls.sum
  end
end
