FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    calories { Faker::Number.decimal(l_digits: 2) }
    protein { Faker::Number.decimal(l_digits: 2) }
    fat { Faker::Number.decimal(l_digits: 2) }
    carbs { Faker::Number.decimal(l_digits: 2) }
    sugar { Faker::Number.decimal(l_digits: 2) }
  end
end
