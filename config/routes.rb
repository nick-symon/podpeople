Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"
  
  resources :podcasts, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :profiles, except: [:new, :create, :destroy]
  resources :reviews
  resources :likes, only: [:create, :show, :destroy]
end
