class DurationDiscountCalculator
  DISCOUNTS = { 1 => 0.1, 4 => 0.3, 10 => 0.5 }.freeze

  def self.calculate(rental_duration_in_days, price_per_day)
    total_price = 0
    (1..rental_duration_in_days).each do |day|
      discount = 0
      DISCOUNTS.each do |duration, value|
        discount = value if day > duration
      end
      total_price += price_per_day * (1 - discount)
    end
    total_price.to_i
  end
end
