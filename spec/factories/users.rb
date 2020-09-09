FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.free_email}
    password {"123abc"}
    password_confirmation {password}
    family_name {"松雪"}
    first_name  {"彩花"}
    family_name_reading {"マツユキ"}
    first_name_reading {"アヤカ"}
    birthday {19910906}
  end
end
