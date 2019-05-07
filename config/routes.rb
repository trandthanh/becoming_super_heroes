Rails.application.routes.draw do
  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users

  resources :mentees, only: [:new, :create]
  get '/mentees/confirm', to: 'mentees#confirm'

  resources :contacts, only: [:new, :create]
  resources :wishes, only: [:new, :create]
  get '/wishes/confirm', to: 'wishes#confirm'

  resources :tracks, only: [:create]

  # resources :users, except: [:index, :new, :create, :edit, :update, :destroy, :show] do
  #   resources :wishes, only: [:create]
  # end

  get '/dashboards', to: 'dashboards#index', as: :dashboard_user
  get '/nosactions', to: 'pages#nosactions'
  get '/notrehistoire', to: 'pages#notrehistoire'
  namespace :admin do
    root to: "dashboards#index"
    resources :wishes, only: [:index, :show]
    resources :contacts, only: [:index, :show]
    resources :courses, only: [:index, :show, :new, :create] do
      resources :attendances, only: [:new, :create]
    end
    resources :talks, only: [:index, :show, :new, :create]
    resources :subjects, only: [:show]
    resources :users, only: [:index]
    resources :matches, only: [:index]
    resources :mentees, only: [:show]
  end

  root to: 'pages#home'
end
