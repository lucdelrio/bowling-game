require_relative 'player'
require_relative 'frame'
require_relative 'final_frame'
require_relative 'score_calculator'

class Player
  attr_reader :name, :frames, :frame_count

  def initialize(name, frame_count)
    @name = name
    @frames = []
    @frame_count = frame_count
    @current_frame = 0
  end

  def roll(pins)
    setup_frame if frames[@current_frame].nil?
    frames[@current_frame].add_roll(pins)
    @current_frame += 1 if frames[@current_frame].complete?
  end

  def score
    score_calculator = ScoreCalculator.new
    score_calculator.calculate_score(frames)
  end

  private

  def setup_frame
    frames << if @current_frame < frame_count - 1
                Frame.new
              else
                FinalFrame.new
              end
  end
end
