class SidiBd::V1::MateriaAlumnoController < ApplicationController

  def getMat

    matri = params[:matricula]

    @student = MateriaAlumno.find_by("matricula = ?",matri)

    render "sidi_bd/v1/materia_alumno/show"

  end

end