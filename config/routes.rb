Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  get '/users/decode_token', to: 'users#decode_token'
  resources :user_quotes
  resources :quotes
  resources :muscles
  resources :pose_muscles
  resources :poses
  resources :sequence_poses
  resources :sequences
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
