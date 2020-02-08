class FinalFrame < Frame
  def complete?
    rolls.length == 3 || rolls.length == 2 && score < 10
  end
end
