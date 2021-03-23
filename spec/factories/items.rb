FactoryBot.define do
  factory :item do
    name     {Faker::Name.initials(number: 2)}
    concept  {"aaaa"}
    category_id {"メンズ"}
    item_status_id {"新品、未使用"}
    delivery_price_id {"送料込み(出品者負担)"}
    delivery_area_id {"北海道"}
    delivery_date_id {"1~2日で発送"}
    price             {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
