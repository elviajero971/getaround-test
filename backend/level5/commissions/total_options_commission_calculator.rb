# frozen_string_literal: true

module Commissions
  class TotalOptionsCommissionCalculator < CommissionCalculator
    def compute
      return 0 if rental.options.empty?

      total = rental.options.sum do |option|
        calculator_for(option).compute
      end

      total.to_i
    end

    private

    def calculator_for(option)
      Object.const_get("Commissions::Option#{pascale_case(option)}CommissionCalculator").new(rental: rental)
    end

    def pascale_case(option)
      Shared::StringFormatter.transform(option.to_s)
    end
  end
end
