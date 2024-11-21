# frozen_string_literal: true

module Pricing
  # This class is responsible for calculating the price of an additional insurance
  class OptionAdditionalInsurancePriceCalculator < PriceCalculator
    OPTION_ADDITIONAL_INSURANCE_PRICE_PER_DAY = 1000

    def compute
      (number_of_days * OPTION_ADDITIONAL_INSURANCE_PRICE_PER_DAY).to_i
    end
  end
end
