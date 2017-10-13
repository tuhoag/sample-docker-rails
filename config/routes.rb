Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :articles, only: [:index, :show] do
				resources :comments, only: [:index]
			end
			resources :users, only: [:index]
		end
	end
	resources :users, only: [:new, :create]

	get '/sessions/login', to: 'sessions#new', as: :login
  post '/sessions/login', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: :logout

  #get '/articles', to: 'articles#index'
  resources :articles, only: [:index, :show, :edit, :update, :destroy] do
  	resources :comments, only: [:index]
  end

	resources :chat_rooms, only: [:index, :create, :show, :new] do
		resources :messages, only: [:create]
	end
	resources :photos, only: [:index]


end
