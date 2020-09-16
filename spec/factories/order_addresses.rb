FactoryBot.define do
  factory :order_address do
    user { Faker::Number.digit }
    item { Faker::Number.digit }
    postal { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { '09012345678' }
    token { 'tok_5ca06b51685e001723a2c3b4aeb4' }
    price { 10_000 }
  end
end
