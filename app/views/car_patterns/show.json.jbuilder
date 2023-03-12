# frozen_string_literal: true

json.id @car_pattern.id
json.name @car_pattern.name

json.parts @car_pattern_units.each do |cpu|
  json.part cpu.part.title
  json.quantity cpu.quantity
end
