FactoryBot.define do
  factory :expense do
    expense_category { nil }
    budget { nil }
    description { "Test description" }
    amount { "9.99" }
  end
end
