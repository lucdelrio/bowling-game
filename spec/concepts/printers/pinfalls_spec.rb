require 'spec_helper'
require 'active_interaction'
require_relative '../../../models/frame'
require_relative '../../../models/final_frame'
require_relative '../../../concepts/printers/pinfalls.rb'

RSpec.describe Printers::Pinfalls do
  context 'given a list of frames' do
    it 'prints 3 frames' do
      first_frame = Frame.new
      first_frame.add_roll('X')
      first_frame.add_roll('7')
      second_frame = Frame.new
      second_frame.add_roll('/')
      second_frame.add_roll('9')
      third_frame = FinalFrame.new
      third_frame.add_roll('X')
      third_frame.add_roll('8')
      third_frame.add_roll('1')

      result = "Pinfalls       X   7   /   9   X   8   1\n"
      expect { described_class.run!(frames: [first_frame, second_frame, third_frame]) }.to output(result).to_stdout
    end
  end
end
