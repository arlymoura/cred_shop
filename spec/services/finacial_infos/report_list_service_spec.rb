require 'rails_helper'

RSpec.describe FinancialInfos::ReportListService, type: :service do
  let!(:financial_info_1) { create(:financial_info, salary: 900.00) }
  let!(:financial_info_2) { create(:financial_info, salary: 1500.00) }
  let!(:financial_info_3) { create(:financial_info, salary: 2500.00) }
  let!(:financial_info_4) { create(:financial_info, salary: 3500.00) }
  let!(:financial_info_5) { create(:financial_info, salary: 4500.00) }
  let!(:financial_info_6) { create(:financial_info, salary: 10000.00) }

  describe "#call" do
    it "returns the correct report data" do
      service = FinancialInfos::ReportListService.new
      result = service.call

      expect(result[:report].size).to eq(4)
      expect(result[:report]).to include(
        { range: "Até R$ 1.045,00", count: 1 },
        { range: "De R$ 1.045,01 a R$ 2.089,60", count: 1 },
        { range: "De R$ 2.089,61 até R$ 3.134,40", count: 1 },
        { range: "De R$ 3.134,41 até R$ 6.101,06", count: 2 }
      )
    end

    it "returns the correct chart data" do
      service = FinancialInfos::ReportListService.new
      result = service.call

      expect(result[:chart_data]).to eq(
        [
          { label: "Até R$ 1.045,00", value: 1 },
          { label: "De R$ 1.045,01 a R$ 2.089,60", value: 1 },
          { label: "De R$ 2.089,61 até R$ 3.134,40", value: 1 },
          { label: "De R$ 3.134,41 até R$ 6.101,06", value: 2 }
        ]
      )
    end
  end
end
