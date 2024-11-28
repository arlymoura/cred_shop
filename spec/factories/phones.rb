FactoryBot.define do
  factory :phone do
    phone_number { Faker::PhoneNumber.phone_number }
    phone_type { "personal" }

    trait :personal do
      phone_type { "personal" }
    end

    trait :reference do
      phone_type { "reference" }
    end

    proponent { create(:proponent, :without_associations) }
  end
end
