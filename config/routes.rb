Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
}
root 'users#index'

resources :users, only: %i[index show] do
  resources :posts, only: %i[index show new create destroy] do
    resources :comments, only: %i[index show new create edit update destroy]
    resources :likes, only: %i[index show create destroy]
  end
  namespace :api, defaults: { format: :json } do
    resources :sessions
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end  
end