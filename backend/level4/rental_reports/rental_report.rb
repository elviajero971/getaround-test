# frozen_string_literal: true

module RentalReports
  class RentalReport
    attr_reader :rental_id, :price, :insurance_fee, :assistance_fee, :drivy_fee, :owner_income

    def initialize(rental_id:, price:, insurance_fee:, assistance_fee:, drivy_fee:, owner_income:)
      @rental_id = rental_id
      @price = price
      @insurance_fee = insurance_fee
      @assistance_fee = assistance_fee
      @drivy_fee = drivy_fee
      @owner_income = owner_income
    end
  end
end