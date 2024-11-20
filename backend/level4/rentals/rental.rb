module Rentals
  class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance, :number_of_rental_days

    def initialize(id:, car:, start_date:, end_date:, distance:)
      @id = id
      @car = car
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
      @distance = distance
      @number_of_rental_days = Shared::DurationInDays.new(start_date: @start_date, end_date: @end_date).compute
    end
  end
end