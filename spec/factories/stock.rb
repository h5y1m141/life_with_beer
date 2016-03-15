FactoryGirl.define do
  factory :stock do
    sequence(:color) { |n| "color#{n}" }
    sequence(:size) { |n| "size#{n}" }

    trait :on_stock do
      exist true
    end

    trait :off_stock do
      exist false
    end
  end
end
