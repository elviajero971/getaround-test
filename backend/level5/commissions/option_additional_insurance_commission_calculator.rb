# frozen_string_literal: true

module Commissions
  class OptionAdditionalInsuranceCommissionCalculator < CommissionCalculator
    ADDITIONAL_INSURANCE_COMMISSION_PERCENTAGE = 1

    def compute
      additional_insurance_price * ADDITIONAL_INSURANCE_COMMISSION_PERCENTAGE
    end

    private

    def additional_insurance_price
      Pricing::OptionAdditionalInsurancePriceCalculator.new(rental: rental).compute
    end
  end
end
