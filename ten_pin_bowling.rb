# frozen_string_literal: true

require 'byebug'
require_relative 'model/no_file_exception'
require_relative 'model/game'

class TenPinBowling
  raise NoFileException if ARGV[0].nil?

  game = Game.new(ARGV[0])
  game.print_scoreboard
end
