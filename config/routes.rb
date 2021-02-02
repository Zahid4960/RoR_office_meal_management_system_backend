Rails.application.routes.draw do

  post "registration" => "authentication#registration"
  post "login" => "authentication#login"

  resources :office_type
  resources :office
  resources :designation
  resources :department
  resources :day
end
