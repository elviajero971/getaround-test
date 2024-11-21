# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the total price of a rental
  class TotalPriceWithoutOptionsCalculator < PriceCalculator
    def compute
      duration_price + distance_price
    end

    private

    def duration_price
      Pricing::DurationPriceCalculator.new(rental: rental).compute
    end

    def distance_price
      Pricing::DistancePriceCalculator.new(rental: rental).compute
    end
  end
end
