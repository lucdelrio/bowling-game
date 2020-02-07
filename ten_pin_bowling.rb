require 'byebug'
require_relative 'models/program'

class TenPinBowling
  Program.new(ARGV[0])
end
