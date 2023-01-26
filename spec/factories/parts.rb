FactoryBot.define do
  factory :part do
    serial_number { '0001TT' }
    title { 'test_part' }
    price { 1000 }
  end
end
