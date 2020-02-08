require_relative '../models/exceptions/invalid_score_exception'

class Game
  FRAME_COUNT = 10

  attr_reader :players

  def initialize(file)
    @players = []
    file_data = File.read(file).split

    file_data.each_with_index do |data, index|
      if index.even?
        players.push(Player.new(data, FRAME_COUNT)) if find_player(data).nil?
      elsif index.odd?
        player = find_player(file_data[index - 1])
        player.roll(data)
      end
    end
  end

  def print_scoreboard; end

  private

  def find_player(name)
    players.select { |player| player.name == name }.first
  end
end
