Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'
  post 'users' => 'users#create'
  
  get 'users/profile'
  root 'users#index'

  resources :users
  resources :posts
end
