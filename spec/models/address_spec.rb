require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:proponent) }

  it "is valid with valid attributes" do
    address = build(:address)
    expect(address).to be_valid
  end

  it "is invalid without a street" do
    address = build(:address, street: nil)
    expect(address).not_to be_valid
  end
end
