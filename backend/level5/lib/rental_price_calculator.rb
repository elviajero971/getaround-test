require_relative './duration_discount_calculator'

class RentalPriceCalculator
  attr_reader :rental

  def initialize(rental)
    @rental = rental
  end

  def calculate
    duration_price = DurationDiscountCalculator.calculate(rental.duration, rental.car.price_per_day)
    distance_price = rental.distance * rental.car.price_per_km

    duration_price + distance_price
  end
end
