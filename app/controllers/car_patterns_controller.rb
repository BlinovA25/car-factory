class CarPatternsController < ApplicationController
  before_action :set_car_pattern, only: [:show, :update, :destroy]

  # GET /car_patterns
  def index
    @car_patterns = CarPattern.all

    render json: @car_patterns
  end

  # GET /car_patterns/1
  def show
    render json: @car_pattern
  end

  # POST /car_patterns
  def create
    @car_pattern = CarPattern.new(car_pattern_params)

    if @car_pattern.save
      render json: @car_pattern, status: :created, location: @car_pattern
    else
      render json: @car_pattern.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /car_patterns/1
  def update
    if @car_pattern.update(car_pattern_params)
      render json: @car_pattern
    else
      render json: @car_pattern.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car_pattern
    @car_pattern = CarPattern.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def car_pattern_params
    params.require(:car_pattern).permit(:name, :description)
  end
end
