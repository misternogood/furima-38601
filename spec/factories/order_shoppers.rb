FactoryBot.define do
  factory :order_shopper do
    postal_code              { '123-4567' }
    prefecture_id            { Faker::Number.between(from: 2, to: 48) }
    city                     { '横浜市緑区' }
    addresses                { '青山1-1-1' }
    building                 { '柳ビル103' }
    phone_number             { '08012345678' }
    token                    { Payjp.api_key = ENV['PAYJP_SECRET_KEY'] }
  end
end
