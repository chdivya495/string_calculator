class StringCalculator
  def add(input)
    return 0 if input.empty?
    return input.to_i if contains_a_single_number(input)
    return "Invalid Input" if input.end_with?("\n")
    sum_of_numbers(input)
  end

  def contains_a_single_number(input)
    input.length == 1 && (input =~ /[0-9]/) == 0 && input.to_i >= 0
  end

  def contains_a_delimiter(input)
    input.start_with?("//")
  end

  def sum_of_numbers(input)
    if contains_a_delimiter(input)
      delimiter = custom_delimiter(input)
      numbers = extract_numbers_with_delimiter(input, delimiter)
    else
      numbers = extract_numbers_with_default_delimiters(input)
    end
    handle_negative_numbers(numbers)
  end

  def custom_delimiter(input)
    input.split("//").last[0]
  end

  def extract_numbers_with_delimiter(input, delimiter)
    input.split("\n").last.split(delimiter).map(&:to_i)
  end

  def extract_numbers_with_default_delimiters(input)
    input.split(/[,\n]/).map(&:to_i)
  end

  def handle_negative_numbers(numbers)
    negative_numbers = get_negative_numbers(numbers)
    if negative_numbers.length == 1
      return negative_numbers.first
    elsif negative_numbers.any?
      return "Negative numbers not allowed #{negative_numbers.join(',')}"
    else
      numbers.sum
    end
  end

  def get_negative_numbers(numbers)
    numbers.select { |n| n.negative? }
  end
end
