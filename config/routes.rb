Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
root 'users#index'

resources :users, only: %i[index show] do
  resources :posts, only: %i[index show new create] do
    resources :comments, only: %i[index show new create edit update destroy]
    resources :likes, only: %i[index show create destroy]
  end
end  
end