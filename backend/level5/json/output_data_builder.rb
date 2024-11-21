# frozen_string_literal: true

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
          "options": rental_report.options,
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
              "amount": rental_report.insurance_commission
            },
            {
              "who": 'assistance',
              "type": 'credit',
              "amount": rental_report.assistance_commission
            },
            {
              "who": 'drivy',
              "type": 'credit',
              "amount": rental_report.drivy_commission
            }
          ]
        }
      end

      { rentals: results }
    end
  end
end
