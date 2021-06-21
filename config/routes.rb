Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :results, only: [:index]
  resources :labels, only: [:show, :new, :create, :edit, :update] do
    resources :events, only: [:new, :create], module: :labels
  end

  resources :artists do
    resources :songs, only: [:new, :create]
    resources :events, module: :artists
  end

  resources :chatrooms, only: [:show, :create, :index] do
    resources :messages, only: [:create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :show]
    end
  end
  
  get '/styleguide', to: 'pages#styleguide'
  get '/redirect', to: 'pages#redirect'

end
