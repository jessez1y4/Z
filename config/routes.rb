StyleMe::Application.routes.draw do
  root 'posts#home'

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    passwords: 'passwords'
  }

  # controller :users do
  #   get 'users/sign_up/email_check' => :check_email_uniqueness
  #   get 'users/sign_up/username_check' => :check_username_uniqueness
  # end

  resources :users, except: [:edit, :update] do
    resources :posts
    member do
      get :following, :followers
    end
  end

  # current_user
  resource :user

  resources :sign_in_authentications, only: [:destroy]

  resources :follow_relationships, only: [:create, :destroy]

  resources :like_relationships, only: [:create, :destroy]

  resources :posts do
    resources :comments
  end

  resources :channels do
    resources :posts
  end

  resources :channel_memberships

  resources :tags

  resources :bookmarkings
end
