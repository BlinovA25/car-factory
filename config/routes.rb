Rails.application.routes.draw do
  resources :cars
  resources :car_patterns do
    resources :car_pattern_units
  end
  resources :parts
  get "/parts/get_ancestors/:part_id", to: "parts#show_ancestors"
end
