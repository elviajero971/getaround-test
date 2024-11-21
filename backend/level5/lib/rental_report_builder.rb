require_relative './car'
require_relative './rental'
require_relative './rental_price_calculator'
require_relative './rental_action_calculator'

class RentalReportBuilder
  def self.build(cars:, rentals:, options:)
    cars_hash = cars.map { |car_data| [car_data['id'], Car.new(car_data)] }.to_h

    rentals.map do |rental_data|
      car = cars_hash[rental_data['car_id']]
      rental_options = options.select { |option| option['rental_id'] == rental_data['id'] }
      rental = Rental.new(rental_data, car, rental_options)

      price = RentalPriceCalculator.new(rental).calculate
      actions = RentalActionCalculator.new(rental: rental, price: price).calculate

      {
        id: rental.id,
        options: rental.options,
        actions: actions
      }
    end
  end
end
