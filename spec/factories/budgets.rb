FactoryBot.define do
  factory :budget do
    wallet { nil }
    uid { "#{wallet.id}-#{Time.zone.now.month}-#{Time.zone.now.year}" }
    month { Time.zone.now.month }
    year { Time.zone.now.year }
    amount { "0.0" }
    balance { "0.0" }
  end
end
