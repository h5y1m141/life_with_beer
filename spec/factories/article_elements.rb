FactoryGirl.define do
  factory :article_element do
    sequence(:tag_name) { |n| "タグ情報#{n}" }
    sequence(:element_data) { |n| "記事のデーター#{n}" }
  end

  trait :instagram do
    tag_name 'instagram'
    element_data 'https://www.instagram.com/p/BBOdQxZrBuy/?taken-by=thenorthface'
  end

  trait :description do
    tag_name 'description'
    element_data 'GO OUTは街中でも違和感なく着ることが出来るアウトドア系の洋服やグッズなどを紹介してるサイトです'
  end
end
