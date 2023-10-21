Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :likes, only: [:index, :show, :create, :destroy]
    end
  end

  # Define the API routes after the standard routes
  namespace :api, defaults: { format: :json } do
    resources :sessions
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end
