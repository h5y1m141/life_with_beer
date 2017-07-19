FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "記事のタイトル#{n}" }
    body "Boddddddy"
  end
end
