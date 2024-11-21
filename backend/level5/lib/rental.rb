require 'date'

class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance, :options

  def initialize(data, car, options = [])
    raise ArgumentError, 'Car is required' unless car
    raise ArgumentError, 'Options must be an array' unless options.is_a?(Array)

    @id = data['id']
    @car = car
    @start_date = Date.parse(data['start_date'])
    @end_date = Date.parse(data['end_date'])
    @distance = data['distance']
    @options = options.map { |option| option['type'] }
  end

  def duration
    (end_date - start_date).to_i + 1
  end
end
