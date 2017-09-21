Rails.application.routes.draw do
  
  #get '/articles', to: 'articles#index'
  resources :articles, only: [:index, :show, :edit, :update, :destroy] do
  	resources :comments, only: [:index]	
  end

  resources :photos, only: [:index]
end
