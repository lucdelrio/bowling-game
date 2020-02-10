require 'rspec'
require 'spec_helper'
require_relative '../../models/frame'
require_relative '../../models/final_frame'

describe 'FinalFrame' do
  context 'when final frame is complete' do
    it 'returns pinfalls ok with all strike' do
      final_frame = FinalFrame.new
      final_frame.add_roll('10')
      final_frame.add_roll('10')
      final_frame.add_roll('10')
      expect(final_frame.pinfalls).to eq %w[X X X]
    end

    it 'returns pinfalls ok with strike and spare' do
      final_frame = FinalFrame.new
      final_frame.add_roll('10')
      final_frame.add_roll('5')
      final_frame.add_roll('5')
      expect(final_frame.pinfalls).to eq ['X', '5', '/']
    end

    it 'returns pinfalls ok with spare and strike' do
      final_frame = FinalFrame.new
      final_frame.add_roll('4')
      final_frame.add_roll('6')
      final_frame.add_roll('10')
      expect(final_frame.pinfalls).to eq ['4', '/', 'X']
    end
  end
end
