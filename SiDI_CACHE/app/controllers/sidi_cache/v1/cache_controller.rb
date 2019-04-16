class SidiCache::V1::CacheController < ApplicationController

  def getCache

    alumCache = $redis.get("alumno")
    recCache = $redis.get("records")

    if alumCache.nil? && recCache.nil?

      @alumno = Student.all.to_a
      @rec = StudentRecord.all.to_a

      $redis.set("alumno", @alumno)
      $redis.set("records", @rec)

    else

      @alumno = alumCache
      @rec = recCache

    end

    render 'sidi_cache/v1/cache/show'

  end

end