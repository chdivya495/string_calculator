require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(string_calculator.add("")).to eq(0)
  end

  it "returns the same number for a single digit string" do
    expect(string_calculator.add("1")).to eq(1)
  end
end
