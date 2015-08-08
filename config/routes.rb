Rails.application.routes.draw do
	
  root to: 'main#index'
  devise_for :users , :path => '', :path_names => { :sign_in => 'login', :sign_up => 'signup', :edit => 'profile' }

  resources :main, only: [:index]
  resources :posts , except: [:index]
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]
end
