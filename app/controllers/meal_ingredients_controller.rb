class MealIngredientsController < ApplicationController
  before_action :set_meal_ingredient, only: %i[show update destroy]

  # GET /meal_ingredients
  # GET /meal_ingredients.json
  def index
    @meal_ingredients = MealIngredient.all
  end

  # GET /meal_ingredients/1
  # GET /meal_ingredients/1.json
  def show; end

  # POST /meal_ingredients
  # POST /meal_ingredients.json
  def create
    @meal_ingredient = MealIngredient.new(meal_ingredient_params)

    if @meal_ingredient.save
      render :show, status: :created, location: @meal_ingredient
    else
      render json: @meal_ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meal_ingredients/1
  # PATCH/PUT /meal_ingredients/1.json
  def update
    if @meal_ingredient.update(meal_ingredient_params)
      render :show, status: :ok, location: @meal_ingredient
    else
      render json: @meal_ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meal_ingredients/1
  # DELETE /meal_ingredients/1.json
  def destroy
    @meal_ingredient.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal_ingredient
    @meal_ingredient = MealIngredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_ingredient_params
    params.require(:meal_ingredient).permit(:meal_id, :ingredient_id, :quantity, :unit_id)
  end
end
