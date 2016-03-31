FactoryGirl.define do
  factory :place do
    sequence(:name) { |n| "name#{n}" }
    prefecture_id 13
    sequence(:address) { |n| "住所#{n}" }
    sequence(:address2) { |n| "住所２#{n}" }
    sequence(:phone_number) {|n| "03-1111-#{n}"}
    place_type 2
    latitude 35.100
    longitude 135.000
    trait :restaurant do
      name 'ビールが飲めるお店'
      place_type 0
    end
    trait :shop do
      name 'ビールが買えるお店'
      place_type 1
    end
  end
end
