StyleMe::Application.routes.draw do
  root 'posts#index'

  devise_for :users

  controller :users do
    get 'users/email_check' => :check_email_uniqueness
    get 'users/username_check' => :check_username_uniqueness
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :follow_relationships, only: [:create, :destroy]

  resources :posts
end
