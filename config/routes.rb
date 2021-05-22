Rails.application.routes.draw do
  devise_for :users
  get 'episodes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  resources :podcasts, only: [:index, :show]

end
