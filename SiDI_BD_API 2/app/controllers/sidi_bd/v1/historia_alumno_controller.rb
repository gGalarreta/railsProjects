class SidiBd::V1::HistoriaAlumnoController < ApplicationController

  def getHis

    matri = params[:matricula]

    @student = HistoriaAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/historia_alumno/show"

  end

end