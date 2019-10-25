Rails.application.routes.draw do
  get 'words/index'
  root 'static_pages#home'
  get '/signup',to:'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to:'sessions#new'
  delete '/logout',to:'sessions#destroy'
  resources :users do
    member do
      get 'following', 'followers'
    end
  end
  resources :sessions
  resources :relationships,only:[:create,:destroy]
  namespace :admin do
    resources :static_pages do
      member do
        get 'admin_page'
      end
    end
    resources :users
    resources :categories do
      resources :words
    end
  end
  resources :categories
  get '/learned',to:'categories#learned'
  get '/not_learned',to:'categories#not_learned'
  resources :lessons do
    resources :answers
  end
  resources :words,only:[:index]
end