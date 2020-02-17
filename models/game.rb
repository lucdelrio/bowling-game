class Game
  FRAME_COUNT = 10

  attr_reader :players

  def initialize
    @players = []
  end

  def save_players_and_rolls(file)
    file_data = File.read(file).split
    file_data.each_with_index do |data, index|
      save_player(data) if index.even?
      save_roll(data, file_data[index - 1]) if index.odd?
    end
  end

  def print_scoreboard
    Printers::Scoreboards.run!(players: players)
  end

  private

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
