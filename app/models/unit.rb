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
  # Defines a constant hash that holds the conversion ratios from various units to a base unit.
  # In this example, each unit is converted to grams, which serves as the base unit for weight measurements.
  # This approach allows for straightforward conversion between any two units by first converting
  # to the base unit (grams) and then to the target unit using these ratios.
  CONVERSION_RATIOS = {
    grams: 1, # Base unit; 1 gram equals 1 gram.
    pounds: 453.592, # 1 pound equals 453.592 grams.
    ounces: 28.3495, # 1 ounce equals 28.3495 grams.
    kilos: 1000 # 1 kilogram equals 1000 grams.
  }.freeze

  # unit_type is an enum that defines the different types of units.
  # Each unit type is represented by a symbol, and its corresponding value is an integer.
  enum unit_type: { grams: 0, pounds: 1, ounces: 2, kilos: 3, liters: 4, milliliters: 5, gallons: 6, quarts: 7, pints: 8, cups: 9, tablespoons: 10, teaspoons: 11, pieces: 12 }

  # Converts a quantity from one unit to another using the defined CONVERSION_RATIOS.
  #
  # @param quantity [Numeric] The quantity to convert.
  # @param from_unit [Symbol] The unit of the quantity before conversion.
  # @param to_unit [Symbol] The unit of the quantity after conversion.
  # @return [Numeric] The quantity converted into the target unit.
  # This method works by converting the quantity to the base unit (grams) first, then
  # to the target unit, leveraging the conversion ratios defined in the CONVERSION_RATIOS hash.
  def convert_quantity(quantity, from_unit, to_unit)
    raise 'Invalid conversion between unit types' unless valid_conversion?(from_unit, to_unit)

    base_quantity = quantity * CONVERSION_RATIOS[from_unit.to_sym]
    base_quantity / CONVERSION_RATIOS[to_unit.to_sym]
  end

  private

  # Checks if a conversion between two units is valid.
  #
  # Parameters:
  #   from_unit (Symbol): The unit to convert from.
  #   to_unit (Symbol): The unit to convert to.
  #
  # Returns:
  #   Boolean: A boolean indicating whether the conversion is valid.
  def valid_conversion?(from_unit, to_unit)
    CONVERSION_RATIOS.keys.include?(from_unit.to_sym) && CONVERSION_RATIOS.keys.include?(to_unit.to_sym)
  end
end
