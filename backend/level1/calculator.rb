class Calculator
  def initialize(cars:, rentals:)
    @cars = cars.map do |car_data|
      Car.new(
        id: car_data['id'],
        price_per_day: car_data['price_per_day'],
        price_per_km: car_data['price_per_km']
      )
    end
    @rentals = rentals
  end

  def calculate_rentals
    result = { 'rentals' => [] }
    @rentals.each do |rental_data|
      car = @cars.find { |c| c.id == rental_data['car_id'] }
      rental = Rental.new(
        id: rental_data['id'],
        car: car,
        start_date: rental_data['start_date'],
        end_date: rental_data['end_date'],
        distance: rental_data['distance']
      )

      result['rentals'] << { 'id' => rental.id, 'price' => rental.calculate_price }
    end
    result
  end
end
