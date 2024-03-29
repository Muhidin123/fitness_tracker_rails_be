# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  unit_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Unit < ApplicationRecord
  enum unit_type: { grams: 0, pounds: 1, ounces: 2, kilos: 3, liters: 4, milliliters: 5, gallons: 6, quarts: 7, pints: 8, cups: 9, tablespoons: 10, teaspoons: 11, pieces: 12 }
end
