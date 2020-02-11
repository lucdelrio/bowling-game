require_relative 'frames'
require_relative 'pinfalls'
require_relative 'scores'

module Printers
  class Scoreboards < ActiveInteraction::Base
    array :players

    def execute
      Printers::Frames.run!(frames_count: players[0].frame_count)
      print_players_scoreboard
    end

    def print_players_scoreboard
      players.each do |player|
        puts player.name
        Printers::Pinfalls.run!(frames: player.frames)
        Printers::Scores.run!(score: player.score)
      end
    end
  end
end
