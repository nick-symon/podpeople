Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  root to: "welcome#index"
  
  resources :podcasts, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :profiles, except: [:new, :create, :destroy] do
    resources :reviews
  end
end
