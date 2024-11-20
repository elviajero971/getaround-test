module Shared
  class DurationInDays
    attr_reader :start_date, :end_date

    def initialize(start_date:, end_date:)
      @start_date = start_date
      @end_date = end_date
    end

    def compute
      (end_date - start_date).to_i + 1
    end
  end
end