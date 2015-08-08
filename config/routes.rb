Rails.application.routes.draw do
	
  root to: 'posts#index'
  devise_for :users , :path => '', :path_names => { :sign_in => 'login', :sign_up => 'signup', :edit => 'profile' }

  resources :posts
  resources :users
  resources :relationships, only: [:create, :destroy]
end
