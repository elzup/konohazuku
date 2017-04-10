Rails.application.routes.draw do
  get 'home/index'
  get :logout, to: 'home#logout'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :articles
end
