Rails.application.routes.draw do

  mount BlogEngine::Engine => "/blog_engine"
end
