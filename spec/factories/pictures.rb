FactoryGirl.define do
  factory :picture do
    width 1
    height 1
    image { Rack::Test::UploadedFile.new(Rails.root.join('app','assets', 'images', 'sample.jpg')) }
    item nil
  end
end
