require 'json'
require 'date'
require_relative 'car'
require_relative 'rental'
require_relative 'calculator'
require_relative 'data_parser'

# Parse input data
input_data = DataParser.parse_input(file_path: 'data/input.json')

# Make calculation
calculator = Calculator.new(cars: input_data[:cars], rentals: input_data[:rentals])
result = calculator.calculate_rentals

# Create output data file
DataParser.write_output(file_path: 'data/output.json', data: result)
puts 'output file has been created successfully inside data folder'
