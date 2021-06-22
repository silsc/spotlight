Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :results, only: [:index]
  resources :labels, only: [:show, :new, :create, :edit, :update] do
    resources :events, only: [:new, :create]
  end

  resources :artists do
    get '/follow', to: 'artists#follow'
    get '/unfollow', to: 'artists#unfollow'
    resources :songs, only: [:new, :create]
    resources :events, only: [:new, :create]
  end

  resources :chatrooms, only: [:show, :create, :index] do
    resources :messages, only: [:create]
  end

  resources :connections, only: [:index]

  
  get '/styleguide', to: 'pages#styleguide'
  get '/redirect', to: 'pages#redirect'
  get '/spotify', to: 'pages#spotify'

end
