module FinancialInfos
  class InssCalculator < ApplicationService
    INSS_RANGES = [
      { limit: 1_045.00, rate: 0.075 },
      { limit: 2_089.60, rate: 0.09 },
      { limit: 3_134.40, rate: 0.12 },
      { limit: 6_101.06, rate: 0.14 }
    ]

    def initialize(salary)
      @salary = salary
    end

    def call
      validate_salary
      calculate_inss
    end

    private

    def validate_salary
      raise ArgumentError, "O salário deve ser um número positivo" if @salary.nil? || @salary <= 0
    end

    def calculate_inss
      total_inss = 0.0
      remaining_salary = @salary

      INSS_RANGES.each_with_index do |range, index|
        previous_limit = previous_range_limit(index)
        range_limit = calculate_range_limit(previous_limit, range[:limit], remaining_salary)

        next if range_limit <= 0

        total_inss += calculate_range_inss(range_limit, range[:rate])
        remaining_salary -= range_limit
        break if remaining_salary <= 0
      end

      truncate_to_two_decimals(total_inss)
    end

    def previous_range_limit(index)
      index.zero? ? 0 : INSS_RANGES[index - 1][:limit]
    end

    def calculate_range_limit(previous_limit, range_limit, remaining_salary)
      [range_limit - previous_limit, remaining_salary].min
    end

    def calculate_range_inss(range_limit, rate)
      truncate_to_two_decimals(range_limit * rate)
    end

    def truncate_to_two_decimals(value)
      (value * 100).to_i / 100.0
    end
  end
end
