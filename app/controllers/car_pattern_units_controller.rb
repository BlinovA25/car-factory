class CarPatternUnitsController < ApplicationController
  before_action :set_car_pattern_unit, only: [:show, :update, :destroy]
  before_action :set_car_pattern, only: [:create]

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
    CarPatternUnit.transaction do
      @car_pattern = CarPattern.find(params[:car_pattern_id]).amoeba_dup
      @car_pattern_unit = @car_pattern.car_pattern_units.new(part_id: car_pattern_unit_params[:part_id])
      if @car_pattern_unit.save && unique?
        render json: @car_pattern_unit, status: :created
      else
        render json: @car_pattern_unit.errors, status: :unprocessable_entity
      end
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

  # Checks if CarPatternUnit is unique
  def unique?
    CarPatternUnit.where(car_pattern_id: @car_pattern.id, part_id: @car_pattern_unit.part_id).none?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_car_pattern_unit
    @car_pattern_unit = CarPatternUnit.find(params[:id])
  end

  def set_car_pattern
    @car_pattern = CarPattern.find(params[:car_pattern_id])
  end

  # Only allow a trusted parameter "white list" through.
  def car_pattern_unit_params
    params.require(:car_pattern_unit).permit(:part_id)
  end
end
