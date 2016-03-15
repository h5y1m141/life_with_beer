FactoryGirl.define do
  factory :item_favorite do
    sequence(:resource_id) { |n| n }
    sequence(:resource_type) { |n| "resource_type#{n}" }
    sequence(:comment) { |n| "comment#{n}" }
  end
end
