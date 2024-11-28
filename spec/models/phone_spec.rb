require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should belong_to(:proponent) }

  it "is valid with valid attributes" do
    phone = build(:phone)
    expect(phone).to be_valid
  end

  it "is invalid without a phone_number" do
    phone = build(:phone, phone_number: nil)
    expect(phone).not_to be_valid
  end
end
