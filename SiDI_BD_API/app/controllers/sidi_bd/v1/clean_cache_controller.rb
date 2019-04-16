class SidiBd::V1::CleanCacheController < ApplicationController

    def clean
      $redis.del "alumno"

      @resClean = "Se ha limpiado el cache del servidor"

      render 'sidi_bd/v1/clean/show'

    end

end