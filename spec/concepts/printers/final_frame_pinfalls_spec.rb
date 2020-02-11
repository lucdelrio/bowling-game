require 'spec_helper'
require 'active_interaction'
require_relative '../../../concepts/printers/final_frame_pinfalls.rb'

RSpec.describe Printers::FinalFramePinfalls do
  context 'given a final frame pinfalls list' do
    it 'prints tab-separated painfalls' do
      pinfalls = %w[X 8 1]
      result = "   X   8   1\n"
      expect { described_class.run!(pinfalls: pinfalls) }.to output(result).to_stdout
    end
  end
end
