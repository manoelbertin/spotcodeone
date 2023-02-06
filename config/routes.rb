Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'


  concern :favoritable do |options|
    shallow do 
      post '/favorite', { to: "favorites#create", on: :member }.merge(options)
      delete '/favorite', { to: "favorites#destroy", on: :member }.merge(options)
    end
  end

  # /api/v1/songs/favorite
  # /api/v1/songs/:id/favorite  << -- com o uso do "on: :member" eu incluo o :id

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: [:index, :show]
      resources :search, only: :index
      resources :albums, only: :show do 
        resources :recently_heards, only: :create
      end
      resources :favorites, only: :index

      resources :songs, only: [] do 
        concerns :favoritable, favoritable_type: 'Song'
    end
  end
end
# /api/v1/albums/:id/recently_heards   <<-- a rota alinhada.