# == Schema Information
#
# Table name: meal_ingredients
#
#  id            :bigint           not null, primary key
#  meal_id       :bigint           not null
#  ingredient_id :bigint           not null
#  quantity      :decimal(, )
#  unit_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class MealIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient
  belongs_to :unit
end
