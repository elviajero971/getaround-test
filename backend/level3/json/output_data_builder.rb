module Json
  class OutputDataBuilder
    attr_reader :rental_reports

    def initialize(rental_reports)
      @rental_reports = rental_reports
    end

    def build
      results = rental_reports.map do |rental_report|
        {
          id: rental_report.rental_id,
          price: rental_report.price,
          commission: {
            insurance_fee: rental_report.insurance_fee,
            assistance_fee: rental_report.assistance_fee,
            drivy_fee: rental_report.drivy_fee
          }
        }
      end

      { rentals: results }
    end
  end
end
