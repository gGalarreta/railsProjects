class SidiCache::V1::CleanCacheController < ApplicationController

    def clean
      $redis.del "alumno"

      @resClean = "Se ha limpiado el cache del servidor"

      render 'sidi_cache/v1/clean/show'

    end

end