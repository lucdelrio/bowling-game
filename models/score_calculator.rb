require_relative 'frame'
require_relative 'final_frame'
require 'byebug'

class ScoreCalculator
  attr_reader :score, :current_roll

  def initialize
    @score = []
  end

  def calculate_score(frames)
    total_rolls = frame_rolls(frames)
    @current_roll = 0
    iterate_frames(frames, total_rolls)
    @score
  end

  private

  def iterate_frames(frames, total_rolls)
    frames.each do |frame|
      @score << if frame.strike?
                  total_score + calculate_strike(total_rolls)
                elsif frame.spare?
                  total_score + calculate_spare(total_rolls)
                else
                  @current_roll += 2
                  total_score + frame.score
                end
    end
  end

  def calculate_strike(total_rolls)
    roll_position = current_roll
    @current_roll += 1

    return strike_sum(total_rolls, roll_position) if roll_position + 1 < total_rolls.size

    total_rolls[roll_position]
  end

  def calculate_spare(total_rolls)
    roll_position = current_roll
    @current_roll += 2

    (roll_position + 2) < total_rolls.size ? 10 + total_rolls[roll_position + 2] : 10
  end

  # rubocop:disable Metrics/LineLength
  def strike_sum(total_rolls, roll_position)
    return (total_rolls[roll_position] + total_rolls[roll_position + 1] + total_rolls[roll_position + 2]) if roll_position + 2 < total_rolls.size

    total_rolls[roll_position] + total_rolls[roll_position + 1]
  end
  # rubocop:enable Metrics/LineLength

  def total_score
    return 0 if score.empty?

    score.last
  end

  def frame_rolls(frames)
    rolls = []
    frames.each do |frame|
      frame.rolls.each do |frame_roll|
        rolls << frame_roll
      end
    end
    rolls
  end
end
