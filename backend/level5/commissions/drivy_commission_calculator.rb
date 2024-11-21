# frozen_string_literal: true

module Commissions
  # This class is responsible for calculating the drivy fee commission
  class DrivyCommissionCalculator < CommissionCalculator
    def compute
      regular_drivy_commission + options_drivy_fee_commission
    end

    private

    def regular_drivy_commission
      total_fee_commission - insurance_fee_commission - assistance_fee_commission
    end

    def total_fee_commission
      Commissions::TotalRegularCommissionCalculator.new(rental: rental).compute
    end

    def insurance_fee_commission
      Commissions::InsuranceCommissionCalculator.new(rental: rental).compute
    end

    def assistance_fee_commission
      Commissions::AssistanceCommissionCalculator.new(rental: rental).compute
    end

    def options_drivy_fee_commission
      Commissions::TotalOptionsDrivyCommissionCalculator.new(rental: rental).compute
    end
  end
end
