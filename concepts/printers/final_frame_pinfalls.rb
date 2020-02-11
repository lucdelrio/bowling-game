module Printers
  class FinalFramePinfalls < ActiveInteraction::Base
    array :pinfalls

    def execute
      pinfalls.each_with_index do |pinfall, index|
        if index < pinfalls.size - 1
          print pinfall.rjust(4)
        else
          puts pinfalls.last.rjust(4)
        end
      end
    end
  end
end
