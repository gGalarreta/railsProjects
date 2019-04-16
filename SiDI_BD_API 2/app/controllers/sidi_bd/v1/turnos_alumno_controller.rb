class SidiBd::V1::TurnosAlumnoController < ApplicationController

  def getTur

    matri = params[:matricula]

    @student = TurnosAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/turnos_alumno/show"

  end

end