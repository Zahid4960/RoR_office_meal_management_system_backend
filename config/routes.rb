Rails.application.routes.draw do
  #Authentication
  # registration routes
  post "registration" => "authentication#registration"
  # login routes
  post "login" => "authentication#login"
  #  routes for office types
  resources :office_type

end
