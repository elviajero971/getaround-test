require_relative '../lib/car'
require_relative '../lib/rental'
require_relative '../lib/rental_price_calculator'
require_relative '../lib/rental_action_calculator'
require_relative '../lib/rental_report_builder'

RSpec.describe RentalReportBuilder do
  let(:car_data) { { 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 } }
  let(:rental_data) { { 'id' => 3, 'car_id' => 1, 'start_date' => '2023-11-20', 'end_date' => '2023-11-20', 'distance' => 100 } }
  let(:option_data_gps) { { 'id' => 1, 'rental_id' => 3, 'type' => 'gps' } }
  let(:option_data_baby_seat) { { 'id' => 2, 'rental_id' => 3, 'type' => 'baby_seat' } }
  let(:cars) { [car_data] }
  let(:rentals) { [rental_data] }
  let(:options) { [option_data_gps, option_data_baby_seat] }

  it 'builds a rental report with the right attributes' do
    expect(RentalReportBuilder.build(cars: cars, rentals: rentals, options: options)).to eq([
      {
        id: 3,
        options: ['gps', 'baby_seat'],
        actions: [
          {
            who: 'driver',
            type: 'debit',
            amount: 3700
          },
          {
            who: 'owner',
            type: 'credit',
            amount: 2800
          },
          {
            who: 'insurance',
            type: 'credit',
            amount: 450
          },
          {
            who: 'assistance',
            type: 'credit',
            amount: 100
          },
          {
            who: 'drivy',
            type: 'credit',
            amount: 350
          }
        ]
      }
    ])
  end
end