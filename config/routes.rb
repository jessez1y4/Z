StyleMe::Application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  controller :users do
    get 'users/email_check' => :check_email_uniqueness
    get 'users/username_check' => :check_username_uniqueness
  end

  resource :posts do
    collection do
      post 'from_web'
    end
  end
end
