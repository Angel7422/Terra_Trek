Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    resources :activities, only: [:new, :create]
    # resources :profiles, only: [:edit, :update]
  end

  resources :activities, only: [:index, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :profiles, only: [:show] do
    member do
      patch :toggle_location
    end
  end

  resources :activities, only: [:index, :show] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :favorites, only: [:index]
  # Defines the root path route ("/")
  # root "posts#index"
end
