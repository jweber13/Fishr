Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :fishing_trips, only: %i[new create show] do
    resources :jobs, only: %i[new index create]
  end

  resources :jobs, only: %i[show update]
  resources :tasks, only: %i[index show new create update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
