Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :sidi_bd, defaults: {format: "json"} do
    namespace :v1 do
      resources :login, :periodos, :token_app, :turno, :pruebas
      post 'login/authorize'
      post 'periodos/getPeriodos'
      post 'token_app/access'
      post 'turno/getTurno'
      post 'cache/getCache'
      post 'clean_cache/clean'
      post 'pruebas/insert'
      post 'pruebas/update'
      post 'pruebas/read'
      post 'pruebas/delete'
    end
    match "*unmatched", via: [:post], to: "master_api_controller#cors_set_access_control_headers"
  end
end
