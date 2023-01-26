FactoryBot.define do
  factory :car_pattern do
    name { 'test_car_pattern' }
    description { 'some description' }
    child { nil }
  end
end
