require_relative './lib/json_handler'
require_relative './lib/rental_report_builder'

input_data = JsonHandler.parse_file('data/input.json')

cars = input_data['cars']
rentals = input_data['rentals']
options = input_data['options']

reports = RentalReportBuilder.build(cars: cars, rentals: rentals, options: options)

JsonHandler.write_file('data/output.json', { rentals: reports })

puts "Output successfully written to 'data/output.json'"
