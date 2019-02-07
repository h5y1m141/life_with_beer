BlogEngine::Engine.routes.draw do
  resources :articles
  get 'preview/:id/edit', to: 'preview#edit'
end
