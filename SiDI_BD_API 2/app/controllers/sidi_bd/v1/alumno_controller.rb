class SidiBd::V1::AlumnoController < ApplicationController

  def getAlumno

    matri = params[:matricula]

    @student = Alumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/alumno/show"

  end

end