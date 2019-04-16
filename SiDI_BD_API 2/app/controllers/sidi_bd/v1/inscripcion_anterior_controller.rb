class SidiBd::V1::InscripcionAnteriorController < ApplicationController

  def getInsAn

    matri = params[:matricula]

    @student = InscripcionAnterior.find_by("matricula = ?",matri)

    render "sidi_bd/v1/inscripcion_anterior/show"

  end

end