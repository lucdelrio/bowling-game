class Frame
  attr_reader :rolls, :pinfalls

  def initialize
    @pinfalls = []
    @rolls = []
  end

  def add_pinfall(pins)
    raise InvalidScoreException if !pins.match?(/F/) && !(0..10).cover?(pins.to_i)

    @rolls << pins.to_i
    annotate(pins)
  end

  def spare?
    rolls.length == 2 && score == 10
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

  private

  def annotate(pins)
    @pinfalls << if pins.match?(/F/)
                   pins
                 elsif strike?
                   'X'
                 elsif spare?
                   '/'
                 else
                   pins
                 end
  end
end
