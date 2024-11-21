# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the price of a rental based on the duration
  class DurationPriceCalculator < PriceCalculator
    DURATION_DISCOUNTS = {
      1 => 0.1,
      4 => 0.3,
      10 => 0.5
    }.freeze

    def compute
      total_price = 0
      (1..number_of_days).each do |day|
        discount = 0
        DURATION_DISCOUNTS.each do |duration, value|
          discount = value if day > duration
        end
        total_price += price_per_day * (1 - discount)
      end
      total_price.to_i
    end

    private

    def price_per_day
      car.price_per_day
    end

  end
end
