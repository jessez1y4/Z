StyleMe::Application.routes.draw do
  root 'posts#index'

  devise_for :users

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
