Rails.application.routes.draw do
  #Authentication
  post "registration" => "authentication#registration"
  # namespace :api do
  #   namespace :v1 do
  #     namespace :employee do
  #       resources :basic_infos
  #     end
  #   end
  # end
end
