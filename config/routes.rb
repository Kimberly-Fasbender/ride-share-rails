Rails.application.routes.draw do
  root to: "homepages#show"

  resources :passengers do
    resources :trips, only: :create
  end

  resources :drivers
  patch "/drivers/:id/availability", to: "drivers#availability", as: "availability"

  resources :trips, except: [:new, :index]
end
