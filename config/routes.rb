Rails.application.routes.draw do
  # get 'sessions/new'

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "profile" => "users#show"
  get "signup" => "users#new"
  post "signup" => "users#create"
  delete "delete/:id" => "users#destroy"


  resources :preparations
  resources :cuisines
  root 'main#index'

  resources :recipes, :courses, :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
