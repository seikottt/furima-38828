FactoryBot.define do
  factory :item do
    sequence(:item_name) { |n| "Item #{n}" }
    sequence(:explanation) { |n| "Explanation for Item #{n}" }
    category_id { 2 }
    item_condition_id { 2 }
    shipping_price_id { 2 }
    prefecture_id { 1 }
    shipping_date_id { 2 }
    price { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'sample.jpg')), filename: 'sample.jpg')
    end
  end
end
