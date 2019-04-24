Rails.application.routes.draw do
  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users

  resources :wishes, only: [:new, :create]
  get '/wishes/confirm', to: 'wishes#confirm'

  resources :tracks, only: [:create]

  # resources :users, except: [:index, :new, :create, :edit, :update, :destroy, :show] do
  #   resources :wishes, only: [:create]
  # end

  namespace :admin do
    root to: "dashboards#index"
    resources :wishes, only: [:index, :show]
    resources :courses, only: [:index, :show, :new, :create]
    resources :talks, only: [:index, :show, :new, :create]
    resources :subjects, only: [:show]
  end

  root to: 'pages#home'
end
