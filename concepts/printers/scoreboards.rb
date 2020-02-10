module Printers
  class Scoreboards < ActiveInteraction::Base
    array :players

    def execute
      print_frame_numbers
      print "\n"
      players.each do |player|
        puts player.name
        print_pinfalls(player)
        print "\n"
        print_score(player.score)
        print "\n"
      end
    end

    def print_pinfalls(player)
      print 'Pinfalls'

      player.frames.each do |frame|
        print_frame_pinfalls(frame)
      end
    end

    def print_frame_pinfalls(frame)
      frame.pinfalls.each do |pinfall|
        if pinfall.match?(/X/) && frame.rolls_count == 3 || !pinfall.match?(/X/)
          print pinfall.rjust(4)
        else
          print pinfall.rjust(8)
        end
      end
    end

    def print_score(score)
      print 'Score'.ljust(10)
      score.each do |current_score|
        print current_score.to_s.ljust(8)
      end
    end

    def print_frame_numbers
      print 'Frame'.ljust(10)

      1.upto(players[0].frame_count) do |number|
        print number.to_s.ljust(8)
      end
    end
  end
end
