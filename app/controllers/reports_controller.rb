class ReportsController < ApplicationController
  def index
    @result = FinancialInfos::ReportListService.call
  end
end
