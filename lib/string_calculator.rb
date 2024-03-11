class StringCalculator
  def add(input)
    return 0 if input.empty?
    return input.to_i if contains_a_single_number(input)
    return "Invalid Input" if input.end_with?("\n")
    sum_of_numbers(input)
  end
end
