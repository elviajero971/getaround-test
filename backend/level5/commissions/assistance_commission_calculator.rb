# frozen_string_literal: true

module Commissions
  # This class is responsible for calculating the assistance fee commission
  class AssistanceCommissionCalculator < CommissionCalculator
    ASSISTANCE_COMMISSION_PER_DAY = 100

    def compute
      (rental.number_of_rental_days * ASSISTANCE_COMMISSION_PER_DAY).to_i
    end
  end
end
