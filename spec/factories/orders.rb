FactoryBot.define do
  factory :order do
    token { 'tok_5ca06b51685e001723a2c3b4aeb4' }
    association :user
    association :item
  end
end
