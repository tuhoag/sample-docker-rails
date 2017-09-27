Rails.application.routes.draw do

	resources :users, only: [:new, :create]

	get '/sessions/login', to: 'sessions#new', as: :login
  post '/sessions/login', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: :logout

  #get '/articles', to: 'articles#index'
  resources :articles, only: [:index, :show, :edit, :update, :destroy] do
  	resources :comments, only: [:index]	
  end

  resources :photos, only: [:index]
end
