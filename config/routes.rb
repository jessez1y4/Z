StyleMe::Application.routes.draw do
  root to: 'posts#index'

  devise_for :users
end