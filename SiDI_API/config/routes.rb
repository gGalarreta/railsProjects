Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :sidi_api, defaults: {format: "json"} do
    namespace :v1 do
      resources :login, :periodo, :turno
      post 'login/getAccess'
      post 'periodos/getPeriodos'
      post 'turno/getTurno'
    end
    match "*unmatched", via: [:post, :options], to: "master_api_controller#cors_set_access_control_headers"
  end
end
