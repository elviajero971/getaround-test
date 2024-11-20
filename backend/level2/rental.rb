require 'date'
require_relative 'calculate_price_per_date'
class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance

  def initialize(id:, car:, start_date:, end_date:, distance:)
    @id = id
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance
  end

  def calculate_price_per_date
    CalculatePricePerDate.new(start_date: start_date, end_date: end_date, price_per_day: car.price_per_day).calculate_price_per_date
  end

  def calculate_price_per_km
    distance * car.price_per_km
  end

  def calculate_price
    calculate_price_per_date + calculate_price_per_km
  end
end