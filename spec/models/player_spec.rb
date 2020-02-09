require 'spec_helper'
require_relative '../../models/game'
require_relative '../../models/player'

describe 'Player' do
  context 'Jeff example' do
    it 'returns ok' do
      jeff_rolls = %w[10 7 3 9 0 10 0 8 8 2 F 6 10 10 10 8 1]
      player = Player.new('Jeff', 10)
      jeff_rolls.each do |current_roll|
        player.roll(current_roll)
      end

      expect(player.score).to eq [20, 39, 48, 66, 74, 84, 90, 120, 148, 167]
    end
  end

  context 'John example' do
    it 'returns ok' do
      john_rolls = %w[3 7 6 3 10 8 1 10 10 9 0 7 3 4 4 10 9 0]
      player = Player.new('John', 10)
      john_rolls.each do |current_roll|
        player.roll(current_roll)
      end

      expect(player.score).to eq [16, 25, 44, 53, 82, 101, 110, 124, 132, 151]
    end
  end

  context 'all strike' do
    it 'returns ok' do
      perfect_rolls = %w[10 10 10 10 10 10 10 10 10 10 10 10]
      player = Player.new('Carl', 10)
      perfect_rolls.each do |current_roll|
        player.roll(current_roll)
      end

      expect(player.score).to eq [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
    end
  end

  context 'all zero' do
    it 'returns ok' do
      null_rolls = %w[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
      player = Player.new('Luke', 10)
      null_rolls.each do |current_roll|
        player.roll(current_roll)
      end

      expect(player.score).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    end
  end
end
