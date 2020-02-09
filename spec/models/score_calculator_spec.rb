require 'spec_helper'
require_relative '../../models/frame'
require_relative '../../models/score_calculator'

# ./interview/jobsity

describe 'ScoreCalculator' do
  context '2 frames, spare at first frame' do
    it 'returns ok' do
      frames = []
      frame1 = Frame.new
      frame2 = Frame.new
      frame1.add_roll('3')
      frame1.add_roll('7')
      frames << frame1
      frame2.add_roll('1')
      frame2.add_roll('5')
      frames << frame2
      score_calculator = ScoreCalculator.new
      expect(score_calculator.calculate_score(frames)).to eq [11, 17]
    end
  end

  context '2 frames, strike at first frame' do
    it 'returns ok' do
      frames = []
      frame1 = Frame.new
      frame2 = Frame.new
      frame1.add_roll('10')
      frames << frame1
      frame2.add_roll('4')
      frame2.add_roll('5')
      frames << frame2
      score_calculator = ScoreCalculator.new
      expect(score_calculator.calculate_score(frames)).to eq [19, 28]
    end
  end

  context '3 frames, all strikes' do
    it 'returns ok' do
      frames = []
      frame1 = Frame.new
      frame2 = Frame.new
      frame3 = Frame.new
      frame1.add_roll('10')
      frame2.add_roll('10')
      frame3.add_roll('10')
      frames << frame1
      frames << frame2
      frames << frame3
      score_calculator = ScoreCalculator.new
      expect(score_calculator.calculate_score(frames)).to eq [30, 50, 60]
    end
  end
end
