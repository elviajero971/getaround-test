# frozen_string_literal: true

module RentalReports
  class RentalReport
    attr_reader :rental_id, :price, :insurance_fee, :assistance_fee, :drivy_fee

    def initialize(rental_id:, price:, insurance_fee:, assistance_fee:, drivy_fee:)
      @rental_id = rental_id
      @price = price
      @insurance_fee = insurance_fee
      @assistance_fee = assistance_fee
      @drivy_fee = drivy_fee
    end
  end
end