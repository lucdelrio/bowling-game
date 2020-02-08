require 'rspec'
require 'spec_helper'
require_relative '../../models/exceptions/no_file_exception'
require_relative '../../models/program'

describe 'Program' do
  context 'without arguments' do
    it 'raise error' do
      expect { Program.new(nil) }.to raise_error(NoFileException)
    end
  end

  context 'with arguments' do
    it 'is expected to not raise errors' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/two_players_rolls.txt')
      expect { Program.new(file_param) }.to_not raise_error
    end
  end
end
