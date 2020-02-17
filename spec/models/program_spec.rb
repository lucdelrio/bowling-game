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
    it 'execute fine' do
      file_param = File.join(File.dirname(__FILE__), './../fixtures/one_player_rolls.txt')
      result = "Frame     1       2       3       4       5       6       7       8       9       10      \nCarl
Pinfalls       X       X       X       X       X       X       X       X       X   X   X   X
Score     30      60      90      120     150     180     210     240     270     300     \n"
      expect { Program.new(file_param) }.to output(result).to_stdout
    end
  end
end
