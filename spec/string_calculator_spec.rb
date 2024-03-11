require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(string_calculator.add("")).to eq(0)
  end

  it "returns the same number for a single digit string" do
    expect(string_calculator.add("1")).to eq(1)
  end

  it "returns the sum of digits when two digits are given separated by comma" do
    expect(string_calculator.add("1,5")).to eq(6)
  end

  it "returns the sum of digits when multiple digits are given separated by comma" do
    expect(string_calculator.add("1,5,6,3")).to eq(15)
  end

  it "returns the sum of digits containing new lines between numbers in the string" do
    expect(string_calculator.add("1\n2,3")).to eq(6)
  end

  it "returns 'Invalid Input' for a string containing new lines at the end" do
    expect(string_calculator.add("1,\n")).to eq("Invalid Input")
  end

  it "returns the sum of digits when a delimiter is given in the string" do
    expect(string_calculator.add("//;\n1;2")).to eq(3)
  end
  
  it "returns 'Negative Numbers not allowed' for a string containing negative numbers" do
    expect(string_calculator.add("1,-5, -3")).to eq("Negative numbers not allowed -5,-3")
  end
  
  it "returns the single negative number when only one negative number is provided" do
    expect(string_calculator.add("-7")).to eq(-7)
  end
end
