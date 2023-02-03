require 'rails_helper'

RSpec.describe "CarPatternUnits", type: :request do
  let(:valid_attributes) {
    { "car_pattern_id" => 1 }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /car_pattern_units" do
    it "index page is available without car_pattern" do
      get car_pattern_units_path
      expect(response).to have_http_status(200)
    end
  end

  # describe "POST /car_pattern_units" do
  #   it "doesn't works without car_pattern" do
  #     post car_pattern_car_pattern_units_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
