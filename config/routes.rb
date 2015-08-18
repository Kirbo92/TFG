Rails.application.routes.draw do
	
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'posts#index'
  devise_for :users , :path => '', :path_names => { :sign_in => 'login', :sign_up => 'signup', :edit => 'profile' }

  resources :posts
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]
  resources :groups
  resources :memberships, only: [:create, :destroy]
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
end
