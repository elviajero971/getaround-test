# frozen_string_literal: true
module Cars
  class CarsBuilder
    attr_reader :cars_data

    def initialize(cars_data)
      @cars_data = cars_data
    end

    def build
      cars = cars_data.map do |car_data|
        Cars::Car.new(id: car_data['id'], price_per_day: car_data['price_per_day'], price_per_km: car_data['price_per_km'])
      end

      cars
    end
  end
end
