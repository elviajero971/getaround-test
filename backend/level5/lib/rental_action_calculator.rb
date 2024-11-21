require_relative './option_calculator'

class RentalActionCalculator
  attr_reader :rental, :price

  COMMISSION_RATE = 0.3
  ASSISTANCE_FEE_PER_DAY = 100

  def initialize(rental:, price:)
    @rental = rental
    @price = price
  end

  def calculate
    [
      { who: 'driver', type: 'debit', amount: driver_debit },
      { who: 'owner', type: 'credit', amount: owner_credit },
      { who: 'insurance', type: 'credit', amount: insurance_fee },
      { who: 'assistance', type: 'credit', amount: assistance_fee },
      { who: 'drivy', type: 'credit', amount: drivy_fee }
    ]
  end

  def options_price_for(option, rental)
    rental.options.include?(option) ? OptionCalculator::OPTION_PRICES[option] * rental.duration : 0
  end

  private

  def driver_debit
    (price + options_price).to_i
  end

  def commission
    price * COMMISSION_RATE
  end

  def options_price
    OptionCalculator.calculate(rental.options, rental.duration)
  end

  def insurance_fee
    (commission / 2).to_i
  end

  def assistance_fee
    (rental.duration * ASSISTANCE_FEE_PER_DAY).to_i
  end

  def drivy_fee
    (commission + options_price_for('additional_insurance', rental) - insurance_fee - assistance_fee).to_i
  end

  def owner_credit
    (price + options_price_for('gps', rental) + options_price_for('baby_seat', rental) - commission).to_i
  end
end
