FactoryBot.define do
  factory :budget do
    wallet { nil }
    amount { Faker::Number.decimal(l_digits: 2) }
    balance { Faker::Number.decimal(l_digits: 2) }
  end
end
