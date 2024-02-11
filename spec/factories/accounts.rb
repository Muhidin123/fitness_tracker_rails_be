FactoryBot.define do
  factory :account do
    password_hash { RodauthMain.allocate.password_hash('password') }
    email { Faker::Internet.email }
    status { 'verified' }
  end
end
