class SidiBd::V1::MovimientoAsesoriaAlumnoController < ApplicationController

  def getMov

    matri = params[:matricula]

    @student = MovimientoAsesoriaAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/movimiento_asesoria_alumno/show"

  end

end