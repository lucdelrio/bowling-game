require 'rspec'
require 'spec_helper'
require_relative '../../models/frame'
require_relative '../../models/exceptions/invalid_score_exception'

describe 'Frame' do
  context 'roll with negative number' do
    it 'raise error' do
      frame = Frame.new
      expect { frame.add_pinfall('-3') }.to raise_error(InvalidScoreException)
    end
  end

  context 'roll with letter A' do
    it 'be ok' do
      frame = Frame.new
      frame.add_pinfall('A')
      expect(frame.score).to eq 0
    end
  end
end
