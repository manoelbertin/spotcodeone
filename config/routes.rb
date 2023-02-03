Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'

  namespace :api, default: { format: :JSON } do
    namespace :v1 do
      resources :dashboard, only: :index
    end
  end
end
