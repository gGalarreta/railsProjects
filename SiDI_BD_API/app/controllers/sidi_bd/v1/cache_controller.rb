class SidiBd::V1::CacheController < ApplicationController

  def getCache

    #Obtenemos informacion del cache por medio de sus identificadores
    alumCache = $redis.get("alumno")
    recCache = $redis.get("records")

    if alumCache.nil? && recCache.nil?

      @alumno = Alumnos.all.to_a
      @rec = RegistroAlumnos.all.to_a

      $redis.set("alumno", @alumno)
      $redis.set("records", @rec)

    else

      @alumno = alumCache
      @rec = recCache

    end

    render 'sidi_bd/v1/cache/show'

  end

end