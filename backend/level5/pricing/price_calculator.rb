# frozen_string_literal: true

module Pricing
  class PriceCalculator
    attr_reader :rental

    def initialize(rental:)
      raise ArgumentError, 'Rental cannot be nil' if rental.nil?

      @rental = rental
    end

    def compute
      raise NotImplementedError
    end

    private

    def car
      rental.car
    end

    def number_of_days
      Shared::DurationInDays.new(start_date: rental.start_date, end_date: rental.end_date).compute
    end
  end
end
