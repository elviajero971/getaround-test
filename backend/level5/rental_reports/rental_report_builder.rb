# frozen_string_literal: true

module RentalReports
  class RentalReportBuilder
    attr_reader :rental, :car

    def initialize(rental:, car:)
      @rental = rental
      @car = car
    end

    def build
      RentalReport.new(
        rental_id: rental.id,
        price: rental_price,
        insurance_commission: insurance_commission,
        assistance_commission: assistance_commission,
        drivy_commission: drivy_commission,
        owner_income: owner_income,
        options: options
      )
    end

    private
    def rental_price
      Pricing::TotalPriceCalculator.new(rental: rental).compute
    end

    def number_of_rental_days
      rental.number_of_rental_days
    end

    def insurance_commission
      Commissions::InsuranceCommissionCalculator.new(rental: rental).compute
    end

    def assistance_commission
      Commissions::AssistanceCommissionCalculator.new(rental: rental).compute
    end

    def drivy_commission
      Commissions::DrivyCommissionCalculator.new(rental: rental).compute
    end

    def owner_income
      Incomes::OwnerIncomesCalculator.new(rental: rental).compute
    end

    def options
      rental.options
    end
  end
end
