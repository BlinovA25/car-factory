class CarPatternUnitsController < ApplicationController
  before_action :set_car_pattern_unit, only: [:show, :update, :destroy]

  # GET /car_pattern_units
  def index
    @car_pattern_units = CarPatternUnit.all

    render json: @car_pattern_units
  end

  # GET /car_pattern_units/1
  def show
    render json: @car_pattern_unit
  end

  # POST /car_pattern_units
  def create
    @car_pattern_unit = CarPatternUnit.new(car_pattern_unit_params)

    if @car_pattern_unit.save
      render json: @car_pattern_unit, status: :created, location: @car_pattern_unit
    else
      render json: @car_pattern_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /car_pattern_units/1
  def update
    if @car_pattern_unit.update(car_pattern_unit_params)
      render json: @car_pattern_unit
    else
      render json: @car_pattern_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /car_pattern_units/1
  def destroy
    @car_pattern_unit.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car_pattern_unit
    @car_pattern_unit = CarPatternUnit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def car_pattern_unit_params
    params.require(:car_pattern_unit).permit(:car_pattern_id, :part_id)
  end
end
