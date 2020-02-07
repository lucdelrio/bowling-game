require_relative 'exceptions/no_file_exception'
require_relative 'game'
require_relative 'player'

class Program
  def initialize(argument)
    raise NoFileException if argument.nil?

    game = Game.new(argument)
    game.print_scoreboard
  end
end
