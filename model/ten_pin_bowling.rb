require 'byebug'
require_relative '../model/no_file_exception'

class TenPinBowling
  fail NoFileException.new if ARGV[0].nil?

  file_data = File.read(ARGV[0]).split 
end





