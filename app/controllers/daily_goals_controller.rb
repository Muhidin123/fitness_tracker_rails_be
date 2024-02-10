class DailyGoalsController < ApplicationController
  before_action :authenticate!
  before_action :set_daily_goal, only: %i[show update destroy]

  # GET /daily_goals
  # GET /daily_goals.json
  def index
    @daily_goals = DailyGoal.all
  end

  # GET /daily_goals/1
  # GET /daily_goals/1.json
  def show; end

  # POST /daily_goals
  # POST /daily_goals.json
  def create
    @daily_goal = DailyGoal.new(daily_goal_params)

    if @daily_goal.save
      render :show, status: :created, location: @daily_goal
    else
      render json: @daily_goal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /daily_goals/1
  # PATCH/PUT /daily_goals/1.json
  def update
    if @daily_goal.update(daily_goal_params)
      render :show, status: :ok, location: @daily_goal
    else
      render json: @daily_goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /daily_goals/1
  # DELETE /daily_goals/1.json
  def destroy
    @daily_goal.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_goal
    @daily_goal = DailyGoal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def daily_goal_params
    params.require(:daily_goal).permit(:calorie_goal, :protein_goal, :fat_goal, :carbs_goal, :sugar_goal, :account_id, :date)
  end
end
