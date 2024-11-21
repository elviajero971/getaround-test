# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the total price of a rental
  class TotalPriceCalculator < PriceCalculator
    def compute
      total_price_without_options + options_prices
    end

    private

    def total_price_without_options
      Pricing::TotalPriceWithoutOptionsCalculator.new(rental: rental).compute
    end

    def options_prices
      Pricing::TotalOptionsPriceCalculator.new(rental: rental).compute
    end
  end
end
