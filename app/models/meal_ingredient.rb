class MealIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient
  belongs_to :unit
end
