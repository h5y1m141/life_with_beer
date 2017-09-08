BlogEngine::Engine.routes.draw do
  resources :articles
  get '/articles/preview/:id', to: 'articles#preview'
end
