require 'rspec'
require 'spec_helper'
require_relative '../../models/game'
require_relative '../../models/player'

describe 'Game' do
  context 'roll is ok' do
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

  context 'file with negative roll' do
    it 'raise error' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/negative_rolls.txt')
      expect { Game.new(file_param) }.to raise_error(InvalidScoreException)
    end
  end
end
