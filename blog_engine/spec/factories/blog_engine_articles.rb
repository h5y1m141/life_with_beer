FactoryGirl.define do
  factory :blog_engine_article, class: BlogEngine::Article do
    sequence(:title) { |n| "記事のタイトル#{n}" }
    body "Boddddddy"
  end
end
