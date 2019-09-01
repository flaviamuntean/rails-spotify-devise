Rails.application.routes.draw do
  get 'videos/new'
  get 'videos/create'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    # get '/users/auth/callback', to: 'users/omniauth_callbacks#spotify'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home", to: "users#index", as: :home
  resources :users, only: [:show] do
    resources :videos, only: [:create]
    resources :audios, only: [:create]
  end

  get "/users/:id/audio", to: "users#audio", as: :user_audio
  get "/users/:id/bio", to: "users#bio", as: :user_bio
  get "/users/:id/influences", to: "users#influences", as: :user_influences

  resources :conversations do
    resources :messages
  end

end
