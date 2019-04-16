Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sidi
  post "/acceso", to:"sidi#acceso"
  get "/login", to:"sidi#login"
  get "/inicio" , to:"sidi#inicio"
  post "/turno" , to:"sidi#turno"
  get "/salida", to:"sidi#salida"
  get "/horario", to:"sidi#horario"
  root :to => 'sidi#login'
end
