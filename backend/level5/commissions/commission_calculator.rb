# frozen_string_literal: true

module Commissions
  # This class is responsible for creating the parent class for all commission calculators
  class CommissionCalculator
    attr_reader :rental

    def initialize(rental:)
      @rental = rental
    end

    def compute
      raise NotImplementedError
    end
  end
end
