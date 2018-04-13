Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'toppages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
  get "signup", to: "users#new"
end
