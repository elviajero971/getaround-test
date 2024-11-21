require_relative 'required_dependencies'

# Parse input data
input_data = Json::DataParseInputFile.perform(file_path: 'data/input.json')

# create cars and rentals
@cars = Cars::CarsBuilder.new(input_data[:cars]).build

@rentals = Rentals::RentalsBuilder.new(rentals_data: input_data[:rentals], cars: @cars, options_data: input_data[:options]).build

# Build rental reports
@rental_reports = RentalReports::RentalReportsBuilder.new(rentals: @rentals).build

# Create output data
output_data = Json::OutputDataBuilder.new(@rental_reports).build

# Create output data file
Json::DataWriteOutputFile.perform(file_path: 'data/output.json', data: output_data)

puts 'output data file has been created successfully inside data folder'
# compare the output file with the expected output file
Json::DataComparator.perform(file_path: 'data/output.json', expected_file_path: 'data/expected_output.json')
