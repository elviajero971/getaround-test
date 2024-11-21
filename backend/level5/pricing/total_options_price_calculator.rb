# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the total options price of a rental
  class TotalOptionsPriceCalculator
    attr_reader :rental

    def initialize(rental:)
      @rental = rental
    end

    def compute
      return 0 if rental.options.empty?

      rental.options.sum do |option|
        calculator_for(option).compute
      end
    end

    private

    def calculator_for(option)
      # Dynamically instantiate the correct option cost calculator
      Object.const_get("Pricing::Option#{pascale_case(option.to_s)}PriceCalculator").new(rental: rental)
    rescue NameError
      raise ArgumentError, "Unknown option: #{option}"
    end

    def pascale_case(option)
      Shared::StringFormatter.transform(option)
    end
  end
end
