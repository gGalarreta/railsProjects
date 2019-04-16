class SidiBd::V1::ExcepcionAlumnoController < ApplicationController

  def getExc

    matri = params[:matricula]

    @student = ExcepcionAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/excepcion_alumno/show"

  end

end