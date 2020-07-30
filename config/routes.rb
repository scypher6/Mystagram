Rails.application.routes.draw do
  resources :comments
  resources :likes
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'pics#index'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :pics do
    resources :likes
    resources :comments
  end

  resources :users, only: [:show]

  post '/follower/:id', to: 'follows#create', as: :follower 

  delete '/pics/:pic_id/likes/:id', to: 'likes#destroy', as: :destroy_like_path

end
