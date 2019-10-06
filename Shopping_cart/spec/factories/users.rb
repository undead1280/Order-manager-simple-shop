FactoryBot.define do
  factory :user do
    email { "test@test2.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
  
  factory :userWithProduct do
    after(:create) do |user|
      create(:product, user: user)
    end
  end
end
