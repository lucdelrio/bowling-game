module Printers
  class FramePinfalls < ActiveInteraction::Base
    array :pinfalls

    def execute
      pinfalls.each do |pinfall|
        if !pinfall.match?(/X/)
          print pinfall.rjust(4)
        else
          print pinfall.rjust(8)
        end
      end
    end
  end
end
