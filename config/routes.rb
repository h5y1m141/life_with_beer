require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/admin/sidekiq'
  devise_for(:users,
             path: 'admin',
             path_names: {sign_in: 'home'},
             controllers: {sessions: 'users/sessions'}
             )
  resources :items
  resources :users
  resources :articles, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :beer_styles, only: [:index, :show]
  resources :areas, only: [:index, :show]
  controller :static_pages do
    get :about
  end
  namespace :admin do
    resources :items do
      collection do
        post :search_by_tag
        post :search_by_brewery
      end
    end
    resources :articles do
      collection do
        post :load_elements
      end
    end
    resources :breweries, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :pictures
    resources :places
    resources :beer_styles, only: [:index]
    resources :areas  do
      collection do
        post :places_belong_to_this_area
      end
    end
  end
  namespace :api, { format: :json } do
    resources :places, only: [:index]
  end
  root to: 'static_pages#index'
  get '/articles/preview/:preview_key', to: 'articles#preview'
end
