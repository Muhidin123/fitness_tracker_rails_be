class MealsController < ApplicationController
  before_action :set_meal, only: %i[show update destroy]

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show; end

  # POST /meals
  # POST /meals.json
  def create
    service = CreateMealService.new(meal_params)
    result = service.call
    if result.is_a?(Meal)
      render json: result, status: :created
    else
      render json: result, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    if @meal.update(meal_params)
      render :show, status: :ok, location: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_params
    params.require(:meal).permit(
      :name,
      :meal_date,
      :account_id,
      ingredients: %i[
        name
        quantity
        unit_type
        calories
        protein
        fat
        carbs
        sugar
      ]
    )
  end
end
