Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :sidi_cache, defaults: {format: "json"} do
    namespace :v1 do
      resources :cache, :clean_cache
      post 'cache/getCache'
      post 'clean_cache/clean'
    end
    match "*unmatched", via: [:post, :options], to: "master_api_controller#cors_set_access_control_headers"
  end

end
