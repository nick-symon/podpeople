Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :podcasts, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :profiles
end
