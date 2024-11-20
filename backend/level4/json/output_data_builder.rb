module Json
  class OutputDataBuilder
    attr_reader :rental_reports

    def initialize(rental_reports)
      @rental_reports = rental_reports
    end

    def build
      results = rental_reports.map do |rental_report|
        {
          "id": rental_report.rental_id,
          "actions": [
            {
              "who": 'driver',
              "type": 'debit',
              "amount": rental_report.price
            },
            {
              "who": 'owner',
              "type": 'credit',
              "amount": rental_report.owner_income
            },
            {
              "who": 'insurance',
              "type": 'credit',
              "amount": rental_report.insurance_fee
            },
            {
              "who": 'assistance',
              "type": 'credit',
              "amount": rental_report.assistance_fee
            },
            {
              "who": 'drivy',
              "type": 'credit',
              "amount": rental_report.drivy_fee
            }
          ]
        }
      end

      { rentals: results }
    end
  end
end
