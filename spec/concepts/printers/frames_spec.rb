require 'spec_helper'
require 'active_interaction'
require_relative '../../../concepts/printers/frames.rb'

RSpec.describe Printers::Frames do
  context 'given a number' do
    it 'prints ten frames numbers' do
      result = "Frame     1       2       3       4       5       6       7       8       9       10      \n"
      expect { described_class.run!(frames_count: 10) }.to output(result).to_stdout
    end

    it 'prints five frames numbers' do
      result = "Frame     1       2       3       4       5       \n"
      expect { described_class.run!(frames_count: 5) }.to output(result).to_stdout
    end
  end
end
