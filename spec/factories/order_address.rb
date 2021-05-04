FactoryBot.define do
  factory :order_address do
    zip_code      { '123-4567' }
    prefecture_id { 15 }
    city          { '横浜市海区' }
    address       { '111-11-1' }
    building      { 'オーシャンビュー101' }
    phone_number  { '09012345678' }
  end
end
