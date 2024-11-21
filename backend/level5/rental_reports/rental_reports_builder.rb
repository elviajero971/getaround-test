module RentalReports
  class RentalReportsBuilder
    attr_reader :rentals

    def initialize(rentals:)
      @rentals = rentals
    end

    def build
      rentals.map do |rental|
        RentalReports::RentalReportBuilder.new(rental: rental, car: rental.car).build
      end
    end
  end
end