FactoryGirl.define do
  factory :user do
    sequence(:email){ |n| "admin#{n}@life-with-beer.info" }
    password 'password'    
  end
end
