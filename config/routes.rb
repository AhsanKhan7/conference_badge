Rails.application.routes.draw do
  get "checkins/show"
  get "attendees/index"
  get "attendees/new"
  get "attendees/create"
  get "events/index"
  get "events/show"
  get "events/new"
  get "events/create"
  devise_for :users
  root "events#index"

  get "/checkin/:token", to: "checkins#show", as: :checkin


  resources :events do
    resources :attendees, only: [ :new, :create, :index ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
