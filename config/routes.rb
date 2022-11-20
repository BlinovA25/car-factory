Rails.application.routes.draw do
  resources :cars
  resources :car_pattern_units
  resources :car_patterns
  resources :parts
end
