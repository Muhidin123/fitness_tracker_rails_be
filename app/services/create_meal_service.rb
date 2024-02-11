# This class is responsible for creating a new meal with its ingredients.
class CreateMealService
  def initialize(params)
    @params = params
    @result = {}
  end

  # Creates a new meal with the provided parameters and its associated ingredients.
  #
  # Returns the created meal if successful, otherwise returns an error message.
  def call
    Meal.transaction do
      meal = Meal.create!(meal_params)
      create_meal_ingredients(meal)
      @result[:success] = true
      meal
    end
  rescue StandardError => e
    @result[:error] = e.message
  end

  private

  # Filters the parameters to only include the necessary ones for creating a meal.
  def meal_params
    @params.slice(:name, :meal_date, :account_id)
  end

  # Creates the meal ingredients for the given meal.
  def create_meal_ingredients(meal)
    @params[:ingredients].each do |ingredient_params|
      ingredient = Ingredient.create!(ingredient_params.except(:quantity, :unit_type))
      MealIngredient.create!(
        meal:,
        ingredient:,
        quantity: ingredient_params[:quantity],
        unit: Unit.find_by!(unit_type: ingredient_params[:unit_type])
      )
    end
  end
end
