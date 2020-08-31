Rails.application.routes.draw do
  #Authentication
  # registration routes
  post "registration" => "authentication#registration"
  # login routes
  post "login" => "authentication#login"
  # namespace :api do
  #   namespace :v1 do
  #     namespace :employee do
  #       resources :basic_infos
  #     end
  #   end
  # end
end
