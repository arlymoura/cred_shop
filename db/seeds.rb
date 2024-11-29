# db/seeds.rb

require 'faker'

puts 'Seeding Proponets...'

User.create!(
  email: 'teste@teste.com',
  password: '123456'
)

20.times do
  proponent = Proponent.create!(
    name: Faker::Name.name,
    cpf: Faker::Number.number(digits: 11),
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)
  )

  proponent.create_address!(
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code
  )
  salary = Faker::Number.decimal(l_digits: 4, r_digits: 2)
  proponent.create_financial_info!(
    salary: salary,
    inss_discount: FinancialInfos::InssCalculator.call(salary)
  )

  2.times do
    proponent.phones.create!(
      phone_number: Faker::PhoneNumber.cell_phone_in_e164,
      phone_type: %w[personal reference].sample
    )
  end
end

puts 'Seeding completed successfully!'

