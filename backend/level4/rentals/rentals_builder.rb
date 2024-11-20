# frozen_string_literal: true

module Rentals
  class RentalsBuilder
    attr_reader :rentals_data, :cars

    def initialize(rentals_data:, cars:)
      @rentals_data = rentals_data
      @cars = cars
    end

    def build
      rentals_data.map do |rental_data|
        car = cars.find { |car| car.id == rental_data['car_id'] }
        Rentals::Rental.new(id: rental_data['id'], car: car, start_date: rental_data['start_date'], end_date: rental_data['end_date'], distance: rental_data['distance'])
      end
    end
  end
end

