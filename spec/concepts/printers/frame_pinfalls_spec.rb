require 'spec_helper'
require 'active_interaction'
require_relative '../../../concepts/printers/frame_pinfalls.rb'

RSpec.describe Printers::FramePinfalls do
  context 'given a pinfalls list with strike' do
    it 'prints tab-separated painfalls' do
      pinfalls = ['X']
      result = '       X'
      expect { described_class.run!(pinfalls: pinfalls) }.to output(result).to_stdout
    end
  end

  context 'given a pinfalls list without strike' do
    it 'prints tab-separated painfalls' do
      pinfalls = %w[9 0]
      result = '   9   0'
      expect { described_class.run!(pinfalls: pinfalls) }.to output(result).to_stdout
    end
  end
end
