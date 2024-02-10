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
require 'rails_helper'

RSpec.describe MealIngredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
