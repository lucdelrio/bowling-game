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
end
