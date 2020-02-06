# frozen_string_literal: true

class Player
  attr_reader :name, :frame, :score

  def initialize(name)
    @name = name
    @frame = Array.new(10)
    @score = []
  end
end
