# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  calories   :decimal(, )
#  protein    :decimal(, )
#  fat        :decimal(, )
#  carbs      :decimal(, )
#  sugar      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord
  has_many :meal_ingredients
end
