# frozen_string_literal: true

module Commissions
  class InsuranceCommissionCalculator < CommissionCalculator
    INSURANCE_COMMISSION_PERCENTAGE = 0.5
    def compute
      (total_commission * INSURANCE_COMMISSION_PERCENTAGE).to_i
    end

    private

    def total_commission
      @total_commission ||= Commissions::TotalRegularCommissionCalculator.new(rental: rental).compute
    end
  end
end
