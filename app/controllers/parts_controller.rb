class PartsController < ApplicationController
  before_action :set_part, only: %i[show update destroy]
  # after_update CarPattern.amoeba_dup_car_pattern(@new_part)

  # GET /parts
  def index
    @parts = Part.actual

    render json: @parts
  end

  def show_ancestors
    @parts = Part.find(params[:part_id]).get_ancestors

    render json: @parts
  end

  # GET /parts/1
  def show
    render json: @part
  end

  # POST /parts
  def create
    @part = Part.new(part_params)

    if unique? && @part.save
      render json: @part, status: :created, location: @part
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parts/1
  def update
    Part.transaction do
      @new_part = Part.create_copy(part_params, @part)
      if @new_part.save && @part.update(child: @new_part.id)
        CarPattern.amoeba_dup_car_pattern(@new_part)
        render json: @new_part
      else
        raise "Part wasn't updated successfully"
        # render json: @new_part.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /parts/1
  # def destroy
  #   if CarPatternUnit.where(part_id: @part.id).none?
  #     @part.destroy
  #   else
  #     raise "Delete CarPatternUnits first"
  #     # render json: "Delete CarPatternUnits first"
  #   end
  # end

  private

  # Check the uniqueness of Part by title
  def unique?
    Part.where(title: @part.title).count < 1
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_part
    @part = Part.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def part_params
    params.require(:part).permit(:serial_number, :title, :price)
  end

  # With orientation on name of part generate serial_number
  def gen_serial_number; end
end
