module FinancialInfos
  class ReportListService < ApplicationService
    def call
      report_data = generate_report
      { report: report_data, chart_data: chart_data(report_data) }
    end

    private

    def generate_report
      ranges = [
        { range: "Até R$ 1.045,00", min: 0, max: 1045.00 },
        { range: "De R$ 1.045,01 a R$ 2.089,60", min: 1045.01, max: 2089.60 },
        { range: "De R$ 2.089,61 até R$ 3.134,40", min: 2089.61, max: 3134.40 },
        { range: "De R$ 3.134,41 até R$ 6.101,06", min: 3134.41, max: 6101.06 }
      ]

      ranges.map do |range|
        count = FinancialInfo.where(salary: range[:min]..range[:max]).count
        { range: range[:range], count: count }
      end
    end

    def chart_data(report_data)
      report_data.map { |data| { label: data[:range], value: data[:count] } }
    end
  end
end
