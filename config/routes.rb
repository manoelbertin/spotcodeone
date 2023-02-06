Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: [:index, :show]
      resources :search, only: :index
      resources :albums, only: :show do 
        resources :recently_heards, only: :create
      end
      resources :favorites, only: :index
    end
  end
end
# /api/v1/albums/:id/recently_heards   <<-- a rota alinhada.