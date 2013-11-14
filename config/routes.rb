StyleMe::Application.routes.draw do
  root 'posts#index'

  devise_for :users
end