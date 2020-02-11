require_relative 'final_frame_pinfalls'
require_relative 'frame_pinfalls'

module Printers
  class Pinfalls < ActiveInteraction::Base
    array :frames

    def execute
      print 'Pinfalls'

      frames[0..-2].each do |frame|
        Printers::FramePinfalls.run!(pinfalls: frame.pinfalls)
      end
      Printers::FinalFramePinfalls.run!(pinfalls: frames.last.pinfalls)
    end
  end
end
