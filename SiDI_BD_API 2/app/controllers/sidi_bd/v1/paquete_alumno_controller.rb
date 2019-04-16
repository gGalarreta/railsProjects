class SidiBd::V1::PaqueteAlumnoController < ApplicationController

  def getPaq

    matri = params[:matricula]

    @student = PaqueteAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/paquete_alumno/show"

  end

end