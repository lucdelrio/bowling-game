module Printers
  class Scores < ActiveInteraction::Base
    array :score

    def execute
      print 'Score'.ljust(10)
      score[0..-2].each do |current_score|
        print current_score.to_s.ljust(8)
      end
      puts score.last.to_s.ljust(8)
    end
  end
end
