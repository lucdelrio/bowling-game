require 'byebug'
require_relative 'models/program'

class BowlingGame
  Program.new(ARGV[0])
end
