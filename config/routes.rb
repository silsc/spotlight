Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :labels, only: [:show, :new, :create, :edit, :update]
  resources :artists, only: [:show, :new, :create, :edit, :update]
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end

  get '/styleguide', to: 'pages#styleguide'
  get '/redirect', to: 'pages#redirect'
end
