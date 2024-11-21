require_relative '../lib/option_calculator'

RSpec.describe OptionCalculator do
  describe '.calculate' do
    it 'raises errors if options is not an array' do
      expect { OptionCalculator.calculate('gps', '3') }.to raise_error(ArgumentError,'Options must be an array')
    end

    it 'raises errors if options are not valid' do
      expect { OptionCalculator.calculate(['jaja'], 3) }.to raise_error(ArgumentError,'Options must be valid')
    end

    it 'raises errors if duration is not a positive integer' do
      expect { OptionCalculator.calculate(['gps'], -3) }.to raise_error(ArgumentError,'Duration must be an integer higher than 0')
      expect { OptionCalculator.calculate(['gps'], 0) }.to raise_error(ArgumentError,'Duration must be an integer higher than 0')
    end

    it 'returns the correct price for each option' do
      expect(OptionCalculator.calculate(['gps'], 3)).to eq(1500)
      expect(OptionCalculator.calculate(['baby_seat'], 4)).to eq(800)
      expect(OptionCalculator.calculate(['additional_insurance'], 1)).to eq(1000)
    end
  end
end