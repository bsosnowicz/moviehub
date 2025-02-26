Rails.application.routes.draw do
  root "home#index"
  resources :passwords, param: :token
  get "home/index"
  resources :movies do
    resources :comments, only: [:new, :create, :destroy]
  end
  resources :series do
    resources :comments, only: [:new, :create, :destroy]
  end
  resources :actors do
    resources :comments, only: [:new, :create, :destroy]
  end
  resources :register, only: [:new, :create]
  resource :session
  
  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  get 'billing', to: 'billing#show'

  get "comments", to: "comments#index"
  get "search", to: "search#index"
  get 'suggestions', to: 'search#suggestions'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
