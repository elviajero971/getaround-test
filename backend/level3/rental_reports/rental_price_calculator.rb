# frozen_string_literal: true

module RentalReports
  class RentalPriceCalculator
    attr_reader :rental, :car

    def initialize(rental:, car:)
      @rental = rental
      @car = car
    end

    def compute
      calculate_price_for_duration + calculate_price_for_km
    end

    private

    def calculate_price_for_duration
      RentalReports::RentalPriceForDurationCalculator.new(number_of_days: number_of_days, price_per_day: car.price_per_day).compute
    end

    def calculate_price_for_km
      distance * car.price_per_km
    end

    def start_date
      rental.start_date
    end

    def end_date
      rental.end_date
    end

    def number_of_days
      Shared::DurationInDays.new(start_date: start_date, end_date: end_date).compute
    end

    def distance
      rental.distance
    end
  end
end
