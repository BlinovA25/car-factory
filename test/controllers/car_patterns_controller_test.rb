require 'test_helper'

class CarPatternsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_pattern = car_patterns(:one)
  end

  test "should get index" do
    get car_patterns_url, as: :json
    assert_response :success
  end

  test "should create car_pattern" do
    assert_difference('CarPattern.count') do
      post car_patterns_url, params: { car_pattern: { description: @car_pattern.description, name: @car_pattern.name } }, as: :json
    end

    assert_response 201
  end

  test "should show car_pattern" do
    get car_pattern_url(@car_pattern), as: :json
    assert_response :success
  end

  test "should update car_pattern" do
    patch car_pattern_url(@car_pattern), params: { car_pattern: { description: @car_pattern.description, name: @car_pattern.name } }, as: :json
    assert_response 200
  end

  test "should destroy car_pattern" do
    assert_difference('CarPattern.count', -1) do
      delete car_pattern_url(@car_pattern), as: :json
    end

    assert_response 204
  end
end
