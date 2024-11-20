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
        insurance_fee: insurance_fee,
        assistance_fee: assistance_fee,
        drivy_fee: drivy_fee,
        owner_income: owner_income
      )
    end

    private
    def rental_price
      RentalReports::RentalPriceCalculator.new(rental: rental, car: car).compute
    end

    def number_of_rental_days
      rental.number_of_rental_days
    end

    def insurance_fee
      RentalReports::RentalPriceCommissionsCalculator.new(rental_amount: rental_price, number_of_days: number_of_rental_days).insurance_fee
    end

    def assistance_fee
      RentalReports::RentalPriceCommissionsCalculator.new(rental_amount: rental_price, number_of_days: number_of_rental_days).assistance_fee
    end

    def drivy_fee
      RentalReports::RentalPriceCommissionsCalculator.new(rental_amount: rental_price, number_of_days: number_of_rental_days).drivy_fee
    end

    def owner_income
      rental_price - insurance_fee - assistance_fee - drivy_fee
    end
  end
end