FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "記事のタイトル#{n}" }
    publish_status 0

    trait :published do
      publish_status 1
    end
  end
end
