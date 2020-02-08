class FinalFrame < Frame
  def third_roll
    rolls[2]
  end

  def complete?
    rolls_count == 3 || rolls_count == 2 && score < 10
  end

  def spare?
    return false if second_roll.nil? && third_roll.nil?
    return (first_roll + second_roll.to_i) == 10 if !second_roll.nil? && third_roll.nil?

    (second_roll + third_roll) == 10
  end
end
