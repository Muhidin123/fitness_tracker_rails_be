class Meal < ApplicationRecord
  belongs_to :account

  enum name: { breakfast: 0, lunch: 1, dinner: 2, snack: 3 }

  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
end
