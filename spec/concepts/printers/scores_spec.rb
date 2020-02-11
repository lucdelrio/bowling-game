require 'spec_helper'
require 'active_interaction'
require_relative '../../../concepts/printers/scores.rb'

RSpec.describe Printers::Scores do
  context 'given an score list' do
    it 'prints scores' do
      score = [16, 25, 44, 53, 82, 101, 110, 124, 132, 151]
      result = "Score     16      25      44      53      82      101     110     124     132     151     \n"
      expect { described_class.run!(score: score) }.to output(result).to_stdout
    end
  end
end
