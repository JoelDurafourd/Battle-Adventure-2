Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  root to: "pages#home"

  resources :users, only: [:show, :index] do
    resources :characters, only: [:new, :create, :show, :index] do
      member do
        post 'travel', to: 'characters#travel' # Travel action for characters
      end
    end
  end

  resources :locations, only: [:new, :create, :destroy] do
    resources :enemies, only: [:new, :create]
  end
  # resources :locations, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
