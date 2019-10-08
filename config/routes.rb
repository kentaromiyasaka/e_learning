Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup',to:'users#new'
  root 'static_pages#home'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to:'sessions#new'
  resources :sessions
end