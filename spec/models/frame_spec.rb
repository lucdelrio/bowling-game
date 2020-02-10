require 'spec_helper'
require_relative '../../models/frame'
require_relative '../../models/exceptions/invalid_score_exception'

describe 'Frame' do
  context 'roll has negative number' do
    it 'raise error' do
      frame = Frame.new
      expect { frame.add_roll('-3') }.to raise_error(InvalidScoreException)
    end
  end

  context 'over ten pinfalls' do
    it 'raise error' do
      frame = Frame.new
      expect { frame.add_roll('11') }.to raise_error(InvalidScoreException)
    end
  end

  context 'roll has letter A' do
    it 'be ok' do
      frame = Frame.new
      frame.add_roll('A')
      expect(frame.score).to eq 0
    end
  end

  context 'when frame is complete' do
    it 'returns pinfalls ok with 3 and 7, spare' do
      frame = Frame.new
      frame.add_roll('3')
      frame.add_roll('7')
      expect(frame.pinfalls).to eq ['3', '/']
    end

    it 'returns pinfalls ok with strike' do
      frame = Frame.new
      frame.add_roll('10')
      expect(frame.pinfalls).to eq ['X']
    end

    it 'returns pinfalls ok with 2 and 5' do
      frame = Frame.new
      frame.add_roll('2')
      frame.add_roll('5')
      expect(frame.pinfalls).to eq %w[2 5]
    end

    it 'returns pinfalls ok with 0 and spare' do
      frame = Frame.new
      frame.add_roll('0')
      frame.add_roll('10')
      expect(frame.pinfalls).to eq ['0', '/']
    end
  end
end
