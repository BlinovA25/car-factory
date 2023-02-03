Rails.application.routes.draw do
  resources :cars
  resources :car_patterns do
    resources :car_pattern_units, only: [:show, :create, :update, :destroy]
  end

  resources :car_pattern_units, only: :index

  resources :parts
  get "/parts/get_ancestors/:part_id", to: "parts#show_ancestors"
end
