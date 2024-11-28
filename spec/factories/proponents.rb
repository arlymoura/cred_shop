FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }

    transient do
      create_associations { true }
    end

    after(:build) do |proponent, evaluator|
      if evaluator.create_associations
        proponent.address ||= build(:address, proponent: proponent)
        proponent.financial_info ||= build(:financial_info, proponent: proponent)
        proponent.phones ||= build_list(:phone, 2, proponent: proponent)
      end
    end

    trait :without_associations do
      create_associations { false }
    end
  end
end
