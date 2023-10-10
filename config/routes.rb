Rails.application.routes.draw do
  root 'users#index'
  # %i is used to create an array in rails,
  # do is used here to define flow of code execution ans used to block of cose it is not a loop!
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
