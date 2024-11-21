# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the price of a rental based on the distance
  class DistancePriceCalculator < PriceCalculator
    def compute
      rental.distance * car.price_per_km
    end
  end
end
