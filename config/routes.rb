Rails.application.routes.draw do

  post "registration" => "authentication#registration"
  post "login" => "authentication#login"

  scope '/Api' do
    resources :office_type
    resources :office
    resources :designation
    resources :department
    get "day" => "day#index"
  end

end
