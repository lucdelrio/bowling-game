module Printers
  class Frames < ActiveInteraction::Base
    integer :frames_count

    def execute
      print 'Frame'.ljust(10)

      1.upto(frames_count - 1) do |number|
        print number.to_s.ljust(8)
      end
      puts frames_count.to_s.ljust(8)
    end
  end
end
