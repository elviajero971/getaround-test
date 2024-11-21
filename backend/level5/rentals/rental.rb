# frozen_string_literal: true

module Rentals
  # This class is responsible for representing a rental
  class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance, :options, :number_of_rental_days

    def initialize(id:, car:, start_date:, end_date:, distance:, options: [])
      raise ArgumentError, 'Car cannot be nil' if car.nil?
      raise ArgumentError, 'Start date cannot be nil' if start_date.nil?
      raise ArgumentError, 'End date cannot be nil' if end_date.nil?
      raise ArgumentError, 'Start date must be before or equal to end date' if Date.parse(start_date) > Date.parse(end_date)
      raise ArgumentError, 'Distance must not be a negative number' if distance.negative?

      @id = id
      @car = car
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
      @distance = distance
      @options = options
      @number_of_rental_days = Shared::DurationInDays.new(start_date: @start_date, end_date: @end_date).compute
    end
  end
end
