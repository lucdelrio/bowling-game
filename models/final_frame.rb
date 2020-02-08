class FinalFrame < Frame
  def complete?
    rolls.length == 3 || rolls.length == 2 && score < 10
  end

  def strike?
    score == 10 || score == 20 || score == 30
  end
end
