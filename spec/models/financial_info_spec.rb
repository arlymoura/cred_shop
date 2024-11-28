require 'rails_helper'

RSpec.describe FinancialInfo, type: :model do
  it { should belong_to(:proponent) }

  it "is valid with valid attributes" do
    financial_info = build(:financial_info)
    expect(financial_info).to be_valid
  end

  it "is invalid without a salary" do
    financial_info = build(:financial_info, salary: nil)
    expect(financial_info).not_to be_valid
  end
end
