Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts, except: [:new] do
    post '/react', to: 'likes#action', as: :react
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show]
  resources :followings, only: [:index, :create, :destroy]
end
