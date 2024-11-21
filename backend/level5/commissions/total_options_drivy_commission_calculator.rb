# frozen_string_literal: true

module Commissions
  class TotalOptionsDrivyCommissionCalculator < CommissionCalculator
    def compute
      additional_insurance_commission
    end

    private

    def additional_insurance_commission
      return 0 unless rental.options.include?('additional_insurance')

      Commissions::OptionAdditionalInsuranceCommissionCalculator.new(rental: rental).compute
    end
  end
end
