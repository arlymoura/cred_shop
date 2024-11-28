FactoryBot.define do
  factory :financial_info do
    salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    inss_discount { (salary || 0.0) * 0.11  }
    proponent { create(:proponent, :without_associations) }
  end
end
