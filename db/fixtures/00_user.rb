User.seed do |user|
  user.email = 'admin@life-with-beer.info'
  user.password = Rails.env == 'production' ? ENV['ADMIN_PASSWORD'] : 'password'
end
