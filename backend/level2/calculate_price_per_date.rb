class CalculatePricePerDate
  attr_reader :start_date, :end_date, :price_per_day

  DURATION_DISCOUNTS = {
    1 => 0.1,
    4 => 0.3,
    10 => 0.5
  }.freeze

  def initialize(start_date:, end_date:, price_per_day:)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @price_per_day = price_per_day
  end

  def rental_duration
    (end_date - start_date).to_i + 1
  end

  def calculate_price_per_date
    total_price = 0
    (1..rental_duration).each do |day|
      discount = 0
      DURATION_DISCOUNTS.each do |duration, value|
        discount = value if day > duration
      end
      total_price += price_per_day * (1 - discount)
    end
    total_price.to_i
  end

end
