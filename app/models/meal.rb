# == Schema Information
#
# Table name: meals
#
#  id         :bigint           not null, primary key
#  name       :integer
#  meal_date  :datetime
#  account_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Meal < ApplicationRecord
  belongs_to :account

  enum name: { breakfast: 0, lunch: 1, dinner: 2, snack: 3 }

  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
end
