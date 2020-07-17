Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  get '/send_message/:id', to: 'rooms#init_chat', as: :init_chat

  resources :posts, except: [:new] do
    post '/react', to: 'likes#action', as: :react
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show]
  resources :followings, only: [:index, :create, :destroy]
  resources :rooms, only: [:show, :index]
  resources :messages, only: [:create]
end
