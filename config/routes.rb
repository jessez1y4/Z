StyleMe::Application.routes.draw do
  root 'posts#index'

  devise_for :users

  controller :users do
    get 'users/email_check' => :check_email_uniqueness
    get 'users/username_check' => :check_username_uniqueness
  end

  resource :posts do
    new do
      get 'upload'
    end
  end
end
