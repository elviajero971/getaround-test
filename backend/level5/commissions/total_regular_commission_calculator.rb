# frozen_string_literal: true

module Commissions
  class TotalRegularCommissionCalculator < CommissionCalculator
    TOTAL_COMMISSIONS_PERCENTAGE = 0.3

    def compute
      (TOTAL_COMMISSIONS_PERCENTAGE * total_rental_price).to_i
    end

    private

    def total_rental_price
      @total_rental_price ||= Pricing::TotalPriceWithoutOptionsCalculator.new(rental: rental).compute
    end
  end
end
