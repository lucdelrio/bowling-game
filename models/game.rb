require_relative '../models/exceptions/invalid_score_exception'

class Game
  FRAME_COUNT = 10

  attr_reader :players

  def initialize(file)
    @players = []
    file_data = File.read(file).split
    save_players_and_rolls(file_data)
  end

  def print_scoreboard
    Printers::Scoreboards.run!(players: players)
  end

  private

  def save_players_and_rolls(file_data)
    file_data.each_with_index do |data, index|
      save_player(data) if index.even?
      save_roll(data, file_data[index - 1]) if index.odd?
    end
  end

  def save_player(data)
    players.push(Player.new(data, FRAME_COUNT)) if find_player(data).nil?
  end

  def save_roll(data, current_player)
    player = find_player(current_player)
    player.roll(data)
  end

  def find_player(name)
    players.select { |player| player.name == name }.first
  end
end
