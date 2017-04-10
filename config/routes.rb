Rails.application.routes.draw do
  root :to => 'home#index'
  get :login, to: 'home#login'
  get :logout, to: 'home#logout'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :articles
end
