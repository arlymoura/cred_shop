require 'rails_helper'

RSpec.describe Proponent, type: :model do
  it { should have_one(:address).dependent(:destroy) }
  it { should have_one(:financial_info).dependent(:destroy) }
  it { should have_many(:phones).dependent(:destroy) }

  it "is valid with valid attributes" do
    proponent = build(:proponent)
    expect(proponent).to be_valid
  end

  it "is invalid without a name" do
    proponent = build(:proponent, name: nil)
    expect(proponent).not_to be_valid
  end
end
