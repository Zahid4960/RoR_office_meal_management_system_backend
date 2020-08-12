Rails.application.routes.draw do
  #Authentication
  get "registration" => "users#registration"
  # namespace :api do
  #   namespace :v1 do
  #     namespace :employee do
  #       resources :basic_infos
  #     end
  #   end
  # end
end
