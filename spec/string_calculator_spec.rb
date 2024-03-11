require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(string_calculator.add("")).to eq(0)
  end
end
