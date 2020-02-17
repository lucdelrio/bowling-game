require 'spec_helper'
require_relative '../../models/game'
require_relative '../../models/player'
require_relative '../../models/exceptions/roll_limit_exception'
require_relative '../../models/exceptions/invalid_score_exception'

describe 'Game' do
  context 'valid game - save_players_and_rolls' do
    it 'counts two players' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/two_players_rolls.txt')
      game = Game.new
      game.save_players_and_rolls(file_param)
      expect(game.players.count).to eq 2
    end

    it 'counts one player' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/one_player_rolls.txt')
      game = Game.new
      game.save_players_and_rolls(file_param)
      expect(game.players.count).to eq 1
    end
  end

  context 'file with negative pinfalls' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/negative_pinfalls.txt')
      game = Game.new
      expect { game.save_players_and_rolls(file_param) }.to raise_error InvalidScoreException,
                                                                        'Invalid score value or incorrect score format'
    end
  end

  context 'file with over ten pinfall in a roll' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/over_ten_pinfalls.txt')
      game = Game.new
      expect { game.save_players_and_rolls(file_param) }.to raise_error InvalidScoreException,
                                                                        'Invalid score value or incorrect score format'
    end
  end

  context 'file with over ten rolls' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/over_ten_rolls.txt')
      game = Game.new
      expect { game.save_players_and_rolls(file_param) }.to raise_error RollLimitException, 'Roll limit reached'
    end
  end
end
