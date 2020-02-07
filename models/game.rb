require_relative '../models/exceptions/invalid_score_exception'

class Game
  FRAME_COUNT = 10

  attr_reader :players

  def initialize(file)
    @players = []
    file_data = File.read(file).split

    file_data.each_with_index do |data, index|
      # par
      if index.even?
        @players.push(Player.new(data, FRAME_COUNT)) if find_player(data).nil?
      end
      # impar
      if index.odd?
        # Throw exception if pins != F or if pins is not between 0 and 10
        # Pasar a Frame
        raise InvalidScoreException if !data.match?(/F/) && (!data.match?(/F/) && !(0..10).cover?(data.to_i))
      end
    end
  end

  def print_scoreboard; end

  private

  def find_player(name)
    players.select { |player| player.name == name }.first
  end
end
