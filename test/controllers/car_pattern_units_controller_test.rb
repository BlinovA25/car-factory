require 'test_helper'

class CarPatternUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_pattern_unit = car_pattern_units(:one)
  end

  test "should get index" do
    get car_pattern_units_url, as: :json
    assert_response :success
  end

  test "should create car_pattern_unit" do
    assert_difference('CarPatternUnit.count') do
      post car_pattern_units_url, params: { car_pattern_unit: { car_pattern_id: @car_pattern_unit.car_pattern_id, part_id: @car_pattern_unit.part_id } }, as: :json
    end

    assert_response 201
  end

  test "should show car_pattern_unit" do
    get car_pattern_unit_url(@car_pattern_unit), as: :json
    assert_response :success
  end

  test "should update car_pattern_unit" do
    patch car_pattern_unit_url(@car_pattern_unit), params: { car_pattern_unit: { car_pattern_id: @car_pattern_unit.car_pattern_id, part_id: @car_pattern_unit.part_id } }, as: :json
    assert_response 200
  end

  test "should destroy car_pattern_unit" do
    assert_difference('CarPatternUnit.count', -1) do
      delete car_pattern_unit_url(@car_pattern_unit), as: :json
    end

    assert_response 204
  end
end
