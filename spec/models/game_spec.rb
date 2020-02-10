require 'spec_helper'
require_relative '../../models/game'
require_relative '../../models/player'
require_relative '../../models/exceptions/roll_limit_exception'

describe 'Game' do
  context 'valid game' do
    it 'counts two players' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/two_players_rolls.txt')
      game = Game.new(file_param)
      expect(game.players.count).to eq 2
    end

    it 'counts one player' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/one_player_rolls.txt')
      game = Game.new(file_param)
      expect(game.players.count).to eq 1
    end
  end

  context 'file with negative pinfalls' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/negative_pinfalls.txt')
      expect { Game.new(file_param) }.to raise_error(InvalidScoreException)
    end
  end

  context 'file with over ten pinfall in a roll' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/over_ten_pinfalls.txt')
      expect { Game.new(file_param) }.to raise_error(InvalidScoreException)
    end
  end

  context 'file with over ten rolls' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/over_ten_rolls.txt')
      expect { Game.new(file_param) }.to raise_error(RollLimitException)
    end
  end
end
