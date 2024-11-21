# frozen_string_literal: true

module Rentals
  class RentalsBuilder
    attr_reader :rentals_data, :cars, :options_data

    def initialize(rentals_data:, cars:, options_data: [])
      @rentals_data = rentals_data
      @cars = cars
      @options_data = options_data
    end

    def build
      raise 'No rentals data provided' if rentals_data.nil? || rentals_data.empty?
      raise 'Options data is not an array' unless options_data.is_a?(Array)

      rentals_data.map do |rental_data|
        car = cars.find { |car| car.id == rental_data['car_id'] }

        raise "Car not found for rental id: #{rental_data['id']}" if car.nil?

        options = selected_options(options_data, rental_data['id'])
        Rentals::Rental.new(
          id: rental_data['id'],
          car: car,
          start_date: rental_data['start_date'],
          end_date: rental_data['end_date'],
          distance: rental_data['distance'],
          options: options
        )
      end
    end

    private

    def selected_options(options_data, rental_data_id)
      options = options_data.select { |option| option['rental_id'] == rental_data_id }
      options.map { |option| option['type'] }
    end
  end
end

