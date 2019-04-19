Rails.application.routes.draw do
  root to: "drivers#index"

  resources :trips, except: [:new, :index]
  patch "/trips/:id/complete", to: "trips#complete", as: "complete_trip"

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :drivers
  patch "/drivers/:id/availability", to: "drivers#availability", as: "availability"
end
