class SidiBd::V1::LogAlumnoController < ApplicationController

  def getLog

    matri = params[:matricula]

    @student = LogAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/log_alumno/show"

  end

end