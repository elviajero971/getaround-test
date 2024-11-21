require_relative '../lib/duration_discount_calculator'

RSpec.describe DurationDiscountCalculator do
  # create a test for the method calculate
  describe '.calculate' do
    # create a test to check if the method returns the correct price for a rental duration of 1 day
    it 'returns the correct price for a rental duration of 1 day' do
      expect(DurationDiscountCalculator.calculate(1, 2000)).to eq(2000)
    end

    # create a test to check if the method returns the correct price for a rental duration of 4 days
    it 'returns the correct price for a rental duration of 4 days' do
      expect(DurationDiscountCalculator.calculate(4, 2000)).to eq(7400)
    end

    # create a test to check if the method returns the correct price for a rental duration of 10 days
    it 'returns the correct price for a rental duration of 10 days' do
      expect(DurationDiscountCalculator.calculate(10, 2000)).to eq(15800)
    end
  end
end