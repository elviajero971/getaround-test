# frozen_string_literal: true

module RentalReports
  # This class is responsible for creating the rental report object
  class RentalReport
    attr_reader :rental_id, :price, :insurance_commission, :assistance_commission, :drivy_commission, :owner_income, :options

    def initialize(rental_id:, price:, insurance_commission:, assistance_commission:, drivy_commission:, owner_income:, options: [])
      raise ArgumentError, 'rental_id is not an Integer' unless rental_id.is_a?(Integer)
      raise ArgumentError, 'price is not an Integer and is not negative' unless price.is_a?(Integer) && price >= 0
      raise ArgumentError, 'insurance_commission is not an Integer and is not negative' unless insurance_commission.is_a?(Integer) && insurance_commission >= 0
      raise ArgumentError, 'assistance_commission is not an Integer and is not negative' unless assistance_commission.is_a?(Integer) && assistance_commission >= 0
      raise ArgumentError, 'drivy_commission is not an Integer and is not negative' unless drivy_commission.is_a?(Integer) && drivy_commission >= 0
      raise ArgumentError, 'owner_income is not an Integer and is not negative' unless owner_income.is_a?(Integer) && owner_income >= 0
      raise ArgumentError, 'options is not an Array' unless options.is_a?(Array)
      
      @rental_id = rental_id
      @price = price
      @insurance_commission = insurance_commission
      @assistance_commission = assistance_commission
      @drivy_commission = drivy_commission
      @owner_income = owner_income
      @options = options
    end
  end
end
