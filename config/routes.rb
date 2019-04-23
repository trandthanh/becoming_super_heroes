Rails.application.routes.draw do
  devise_for :users

  resources :wishes, only: [:new, :create]

  resources :tracks, only: [:create]

  # resources :users, except: [:index, :new, :create, :edit, :update, :destroy, :show] do
  #   resources :wishes, only: [:create]
  # end

  root to: 'pages#home'
end
