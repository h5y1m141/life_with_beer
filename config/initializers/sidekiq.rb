Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379', namespace: 'life_with_beer' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379', namespace: 'life_with_beer' }
end
