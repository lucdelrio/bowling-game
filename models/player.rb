class Player
  attr_reader :name, :frame, :score

  def initialize(name, frame_count)
    @name = name
    @frame = Array.new(frame_count)
    @score = []
  end
end
