Rails.application.routes.draw do

  # resources :basic_info, controller: 'api/v1/employee/basic-info'
  namespace :api do
    namespace :v1 do
      namespace :employee do
        resources :basic_infos
      end
    end
  end

end
