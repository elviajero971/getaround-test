module RentalReports
  class RentalPriceCommissionsCalculator
    attr_reader :rental_amount, :number_of_days

    INSURANCE_FEE_PERCENTAGE = 0.5
    ASSISTANCE_DAILY_FEE = 100
    TOTAL_FEE_PERCENTAGE = 0.3

    def initialize(rental_amount:, number_of_days:)
      @rental_amount = rental_amount
      @number_of_days = number_of_days
    end

    def insurance_fee
      (commission_amount * INSURANCE_FEE_PERCENTAGE).to_i
    end

    def assistance_fee
      number_of_days * ASSISTANCE_DAILY_FEE
    end

    def drivy_fee
      commission_amount - insurance_fee - assistance_fee
    end

    private

    def rental_duration(rental)
      Shared::DurationInDays.new(start_date: rental.start_date, end_date: rental.end_date).compute
    end

    def commission_amount
      (rental_amount * TOTAL_FEE_PERCENTAGE).to_i
    end

  end
end