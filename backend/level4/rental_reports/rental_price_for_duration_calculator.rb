# frozen_string_literal: true

module RentalReports
  class RentalPriceForDurationCalculator
    attr_reader :number_of_days, :price_per_day

    DURATION_DISCOUNTS = {
      1 => 0.1,
      4 => 0.3,
      10 => 0.5
    }.freeze

    def initialize(number_of_days:, price_per_day:)
      @number_of_days = number_of_days
      @price_per_day = price_per_day
    end

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
  end
end
