Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "tweets#index"

  resources :tweets, controller: :tweets, only: [:index, :destroy]
  resource :home, controller: :tweets, only: [:show, :create]
  resources :users, only: [:show]
  resources :signup, controller: :users, only: [:index, :create]
  resources :login, controller: :sessions, only: [:index, :create]
  resources :logout, controller: :sessions, only: :destroy

  # get 'tweets', to: 'tweets#index'
  # get 'home', to: 'tweets#home'
  # post 'tweets', to: 'tweets#create'
  # delete 'tweets/:id', to: 'tweets#destroy'

  # get 'signup', to: 'users#new'
  # post 'signup', to: 'users#create'
  # get 'users/id', to: 'users#show'           //////////////////
  # delete 'users/:id', to: 'users#destroy'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

end
