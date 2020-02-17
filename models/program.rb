require 'active_interaction'
require_relative '../concepts/printers/scoreboards'
require_relative 'exceptions/no_file_exception'
require_relative 'exceptions/invalid_score_exception'
require_relative 'game'
require_relative 'player'

class Program
  def initialize(argument, game = Game.new)
    raise NoFileException if argument.nil?

    game.save_players_and_rolls(argument)
    game.print_scoreboard
  end
end
