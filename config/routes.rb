Rails.application.routes.draw do
  resources :students, only: [:show, :index, :destroy, :update, :create]
  resources :instructors, only: [:show, :index, :destroy, :update, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
