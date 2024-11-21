# frozen_string_literal: true

module Pricing
  class OptionPriceCalculator
    attr_reader :rental

    def initialize(rental:)
      @rental = rental
    end

    def compute
      raise NotImplementedError
    end
  end
end
