require 'date'
class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance

  def initialize(id:, car:, start_date:, end_date:, distance:)
    @id = id
    @car = car
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @distance = distance
  end

  def rental_days
    (end_date - start_date).to_i + 1
  end

  def calculate_price_per_date
    rental_days * car.price_per_day
  end

  def calculate_price_per_km
    distance * car.price_per_km
  end

  def calculate_price
    calculate_price_per_date + calculate_price_per_km
  end
end