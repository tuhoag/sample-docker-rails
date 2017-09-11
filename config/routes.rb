Rails.application.routes.draw do
  resources :comments
  #get '/articles', to: 'articles#index'
  resources :articles, only: [:index, :show]
end
