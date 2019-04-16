Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :sidi_bd, defaults: {format: "json"} do
    namespace :v1 do
      resources :alumno, :excepcion_alumno, :historia_alumno, :inscripcion_anterior, :log_alumno, :materia_alumno,
                :movimiento_asesoria_alumno, :paquete_alumno, :turnos_alumno
      post 'excepcion_alumno/getExc'
      post 'historia_alumno/getHis'
      post 'inscripcion_anterior/getInsAn'
      post 'log_alumno/getLog'
      post 'materia_alumno/getMat'
      post 'movimiento_asesoria_alumno/getMov'
      post 'paquete_alumno/getPaq'
      post 'turnos_alumno/getTur'
      post 'alumno/getAlumno'
    end
    match "*unmatched", via: [:post], to: "master_api_controller#cors_set_access_control_headers"
  end
end
