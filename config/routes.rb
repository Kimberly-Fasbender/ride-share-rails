Rails.application.routes.draw do
  get 'passengers/index'
  get 'passengers/show'
  get 'passengers/destroy'
  get 'passengers/new'
  get 'passengers/create'
  get 'passengers/edit'
  get 'passengers/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
