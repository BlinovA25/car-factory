class CarPatternUnitsController < ApplicationController
  before_action :set_car_pattern_unit, only: [:show, :update, :destroy]
  before_action :set_car_pattern, only: [:create, :update, :destroy]
  before_action :set_part, only: [:create]

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
    @car_pattern_unit = CarPatternUnit.new(car_pattern_id: CarPattern.next_id,
                                           part_id: car_pattern_unit_params[:part_id],
                                           quantity: car_pattern_unit_params[:quantity])

    p @car_pattern_unit

    return unless @car_pattern.actual? && @part.actual? && @car_pattern_unit.unique?

    if @car_pattern.copy && @car_pattern_unit.save
      render json: @car_pattern_unit, status: :created
    else
      render json: @car_pattern_unit.errors, status: :unprocessable_entity
    end
  end

  # TODO: add check for part uniqueness and car_pattern actuality
  # PATCH/PUT /car_pattern_units/1
  def update
    @new_car_pattern_unit = CarPatternUnit.new(@car_pattern_unit.dup.attributes)
    @new_car_pattern_unit.assign_attributes(car_pattern_unit_params)
    @new_car_pattern_unit.assign_attributes(car_pattern_id: CarPattern.next_id)

    return if @new_car_pattern_unit.nil?

    #    render json: "SUCCESS
    #
    # OLD ID #{@car_pattern_unit.id}
    # OLD Part #{@car_pattern_unit.part_id}
    # OLD CarPattern #{@car_pattern_unit.car_pattern_id}
    # OLD Quantity #{@car_pattern_unit.quantity}
    #
    # NEW ID #{@new_car_pattern_unit.id}(null before save)
    # NEW Part #{@new_car_pattern_unit.part_id}
    # NEW CarPattern #{@new_car_pattern_unit.car_pattern_id}
    # NEW Quantity #{@new_car_pattern_unit.quantity}"

    if @car_pattern.copy && @new_car_pattern_unit.save && Part.find(@new_car_pattern_unit.part_id).actual?
      render json: @car_pattern_unit
    else
      render json: @car_pattern_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /car_pattern_units/1
  def destroy
    return unless @car_pattern_unit.actual?

    new_car_pattern = @car_pattern.copy
    CarPatternUnit.find_by(car_pattern_id: new_car_pattern.id, part_id: @car_pattern_unit.part_id).destroy
  end

  private

  def set_part
    @part = Part.find(car_pattern_unit_params[:part_id]) unless car_pattern_unit_params[:part_id].nil?
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
    params.require(:car_pattern_unit).permit(:part_id, :quantity)
  end
end
