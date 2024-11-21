# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the price of an option baby seat
  class OptionBabySeatPriceCalculator < OptionPriceCalculator
    BABY_SEAT_PRICE_PER_DAY = 200

    def compute
      rental.number_of_rental_days * BABY_SEAT_PRICE_PER_DAY
    end
  end
end

