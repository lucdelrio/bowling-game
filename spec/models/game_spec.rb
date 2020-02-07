require 'rspec'
require 'spec_helper'
require_relative '../../models/exceptions/invalid_score_exception'
require_relative '../../models/program'

describe 'Game' do
  context 'roll with negative number' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/negative_rolls.txt')
      expect { Game.new(file_param) }.to raise_error(InvalidScoreException)
    end
  end

  context 'roll with other letter' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/other_letter_rolls.txt')
      expect { Game.new(file_param) }.to raise_error(InvalidScoreException)
    end
  end

  context 'roll is ok' do
    it 'counts two players' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/rolls_test.txt')
      game = Game.new(file_param)
      expect(game.players.count).to eq 2
    end

    it 'counts one player' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/one_player_rolls_test.txt')
      game = Game.new(file_param)
      expect(game.players.count).to eq 1
    end
  end
end
