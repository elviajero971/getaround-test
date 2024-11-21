require_relative '../lib/rental'
require_relative '../lib/car'
require_relative '../lib/rental_price_calculator'
require_relative '../lib/rental_action_calculator'

RSpec.describe Rental do
  let(:car) { Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 }) }
  let(:rental_data) { { 'id' => 1, 'car_id' => 1, 'start_date' => '2023-11-19', 'end_date' => '2023-11-20', 'distance' => 100 } }
  let(:rental) { Rental.new(rental_data, car) }

  it 'creates a rental with the right attributes' do
    expect(rental).to have_attributes(
      id: 1,
      car: car,
      start_date: Date.new(2023, 11, 19),
      end_date: Date.new(2023, 11, 20),
      distance: 100
    )
  end

  it 'raises an error if the car is not found' do
    expect { Rental.new(rental_data, nil) }.to raise_error('Car is required')
  end

  it 'raises an error if options is not an array' do
    expect { Rental.new(rental_data, car, {}) }.to raise_error('Options must be an array')
  end

  it 'calculates the duration correctly' do
    expect(rental.duration).to eq(2)
  end
end
