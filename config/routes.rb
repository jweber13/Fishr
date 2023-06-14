Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users
  root to: "pages#home"

  resources :fishing_trips, only: %i[new create show] do
    resources :jobs, only: %i[new index create]
  end

  resources :jobs, only: %i[show edit update]

  resources :tasks
  resources :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
