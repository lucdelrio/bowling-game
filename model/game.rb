# frozen_string_literal: true

require 'active_support'
require_relative '../model/invalid_score_exception'

class Game
  attr_reader :player

  def initialize(file)
    @frames = []

    file_data = File.read(file).split

    file_data.each_with_index do |data, index|
      # par
      if index.even?

      end
      # impar
      if index.odd?
        # Throw exception if pins != F or if pins is not between 0 and 10
        # Pasar a Frame
        raise InvalidScoreException if !data.match?(/F/) && (!data.match?(/F/) && !(0..10).include?(data.to_i))
      end
    end
  end

  def print_scoreboard
    # puts 'Frame' + '1' +  '2' + '3' + '4' + '5' + '6'
  end
end
