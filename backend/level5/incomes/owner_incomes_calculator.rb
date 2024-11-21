# frozen_string_literal: true

module Incomes
  class OwnerIncomesCalculator
    attr_reader :rental

    def initialize(rental:)
      @rental = rental
    end

    def compute
      regular_price_income + options_price_income
    end

    private

    def regular_price_income
      total_regular_price - total_regular_commissions
    end

    def total_regular_price
      Pricing::TotalPriceWithoutOptionsCalculator.new(rental: rental).compute
    end

    def total_regular_commissions
      Commissions::TotalRegularCommissionCalculator.new(rental: rental).compute
    end

    def options_price_income
      total_options_price - total_options_commissions
    end

    def total_options_price
      Pricing::TotalOptionsPriceCalculator.new(rental: rental).compute
    end

    def total_options_commissions
      Commissions::TotalOptionsCommissionCalculator.new(rental: rental).compute
    end
  end
end
