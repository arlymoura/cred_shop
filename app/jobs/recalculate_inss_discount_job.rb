class RecalculateInssDiscountJob < ApplicationJob
  queue_as :default

  def perform(proponent_id)
    proponent = Proponent.find(proponent_id)
    salary = proponent.financial_info.salary

    inss_discount = FinancialInfos::InssCalculator.new(salary).call
    proponent.financial_info.update(inss_discount: inss_discount)
  end
end
