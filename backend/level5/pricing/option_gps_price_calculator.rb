# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the price of a gps
  class OptionGpsPriceCalculator < OptionPriceCalculator
    GPS_COST_PER_DAY = 500

    def compute
      rental.number_of_rental_days * GPS_COST_PER_DAY
    end
  end
end

