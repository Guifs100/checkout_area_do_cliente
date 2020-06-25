FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    password { '123456' }
    company { create(:company) }
  end
end
