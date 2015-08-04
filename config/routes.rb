Rails.application.routes.draw do

  root to: 'posts#index'
  devise_for :users , :path => '', :path_names => { :sign_in => 'login', :sign_up => 'register' }

  resources :posts
  resources :followers
  resources :users

  

end
