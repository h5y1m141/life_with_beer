FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "name#{n}" }
    sequence(:url) { |n| "http://www.example.com/item/#{n}" }
    sequence(:original_image_url) { |n| "http://www.example.com/item/#{n}" }
    sequence(:description) {|n| "description#{n}"}
    stocks { create_list :stock, 2 }
    tags { create_list :tag, 2 }
    sequence(:ibu) { |n| n }
    pictures { create_list :picture, 1 }
    trait :on_sale do
      discounted true
      original_price 10000
      discount_price 5000
    end

    trait :off_sale do
      discounted false
      original_price 10000
    end

    trait :off_sale do
      discounted false
      original_price 10000
    end

    trait :low_price do
      discounted false
      original_price 500
    end
    trait :coedo do
      name 'COEDO'
    end
  end
end
