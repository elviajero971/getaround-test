class OptionCalculator
  OPTION_PRICES = {
    'gps' => 500,
    'baby_seat' => 200,
    'additional_insurance' => 1000
  }.freeze

  def self.calculate(options, duration)
    raise ArgumentError, 'Options must be an array' unless options.is_a?(Array)
    raise ArgumentError, 'Options must be valid' unless options.all? { |option| OPTION_PRICES.keys.include?(option) }
    raise ArgumentError, 'Duration must be an integer higher than 0' unless duration.is_a?(Integer) && duration.positive?

    options.sum { |option| OPTION_PRICES[option] * duration }.to_i
  end
end
