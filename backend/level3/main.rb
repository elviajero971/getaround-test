require 'json'
require 'date'

require_relative 'shared/duration_in_days'

require_relative 'cars/car'
require_relative 'cars/cars_builder'

require_relative 'rentals/rental'
require_relative 'rentals/rentals_builder'

require_relative 'rental_reports/rental_price_calculator'
require_relative 'rental_reports/rental_price_commissions_calculator'
require_relative 'rental_reports/rental_price_for_duration_calculator'
require_relative 'rental_reports/rental_report'
require_relative 'rental_reports/rental_report_builder'
require_relative 'rental_reports/rental_reports_builder'

require_relative 'json/output_data_builder'
require_relative 'json/data_parse_input_file'
require_relative 'json/data_write_output_file'

# Parse input data
input_data = Json::DataParseInputFile.perform(file_path: 'data/input.json')

# create cars and rentals
@cars = Cars::CarsBuilder.new(input_data[:cars]).build
@rentals = Rentals::RentalsBuilder.new(rentals_data: input_data[:rentals], cars: @cars).build

puts "cars: #{@cars}"
puts "rentals: #{@rentals}"

# Build rental reports
@rental_reports = RentalReports::RentalReportsBuilder.new(rentals: @rentals).build

puts "rental_reports: #{@rental_reports}"


# Create output data
output_data = Json::OutputDataBuilder.new(@rental_reports).build

# Create output data file
Json::DataWriteOutputFile.perform(file_path: 'data/output.json', data: output_data)
puts 'output file has been created successfully inside data folder'
