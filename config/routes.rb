Rails.application.routes.draw do
  get "trips/index"
  get "trips/show"
  get "trips/create"
  get "trips/new"
  get "trips/update"
  get "trips/edit"
  get "trips/destroy"

  root to: "drivers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :passengers

  resources :drivers

  resources :trips
end
