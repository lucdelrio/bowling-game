class Frame
  attr_reader :rolls, :pinfalls

  def initialize
    @pinfalls = []
    @rolls = []
  end

  def add_roll(pins)
    raise InvalidScoreException if !pins.match?(/F/) && !(0..10).cover?(pins.to_i)

    @rolls << pins.to_i
    annotate(pins)
  end

  def first_roll
    rolls[0]
  end

  def second_roll
    rolls[1]
  end

  def rolls_count
    rolls.length
  end

  def spare?
    rolls_count == 2 && score == 10
  end

  def strike?(pins = nil)
    return first_roll.to_i == 10 if pins.nil?

    pins.to_i == 10
  end

  def complete?
    rolls_count == 2 || strike?
  end

  def score
    rolls.sum
  end

  private

  def annotate(pins)
    @pinfalls << if pins.match?(/F/)
                   pins
                 elsif spare?
                   ' /'
                 elsif strike?(pins)
                   ' X'
                 else
                   ' ' + pins
                 end
  end
end
