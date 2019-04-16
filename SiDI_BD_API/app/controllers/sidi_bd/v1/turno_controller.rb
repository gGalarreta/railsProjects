class SidiBd::V1::TurnoController < ApplicationController

  def getTurno

    @token = params[:token]
    periodo = params[:periodo]
    codigo_c = params[:codigo_campus]

    if @token.nil? || periodo.nil? || codigo_c.nil?

      @msgs = {info: "Los campos o uno de los campos viene vacio", status: :unauthorized}
      @error = {info: "Campos vacios", status: :unauthorized}

    else

      id_student = TokenAlumnos.find_by("token = ?",@token)

      alumno = Personas.find_by("id_persona = ?", id_student.matricula)

      periods = Periodos.find_by("id_periodo = ? and id_campus = ?", periodo, codigo_c)

      c_periods = CPeriodos.find_by("id_periodo = ?", periods.id_periodo)

      campus = CCampus.find_by("id_campus = ?", codigo_c)

      s_rec = Alumnos.find_by("matricula = ?", id_student.matricula)

      c_level = CNiveles.find_by("id_nivel = ?", s_rec.id_nivel)

      c_career = CCarreras.find_by("id_carrera = ?", s_rec.id_carrera)

      turno = TurnoAlumnos.find_by("matricula = ? and id_periodo = ? and id_campus = ?", id_student.matricula, periodo, codigo_c)

      if turno.nil?

        sema = Semaforos.find_by("n_pidm = ? and id_periodo = ?",alumno.n_pidm,s_rec.id_periodo)

        unless sema.nil?
          @student = {matricula: id_student.matricula, nombre: alumno.nombre, apellido_paterno: alumno.apellido_paterno, campus: campus.nombre,
                    periodo_desc: c_periods.descripcion, id_nivel: c_level.id_nivel, carrera_nombre: c_career.nombre,
                    concentracion: s_rec.concentracion, madalidad: c_level.descripcion, f_turno_remoto: "N/A", semaforo: sema.semaforo}
        else
          @student = {matricula: id_student.matricula, nombre: alumno.nombre, apellido_paterno: alumno.apellido_paterno, campus: campus.nombre,
                      periodo_desc: c_periods.descripcion, id_nivel: c_level.id_nivel, carrera_nombre: c_career.nombre,
                      concentracion: s_rec.concentracion, madalidad: c_level.descripcion, f_turno_remoto: "N/A", semaforo: 0}
        end
      else

        @student = {matricula: id_student.matricula, nombre: alumno.nombre, apellido_paterno: alumno.apellido_paterno, campus: campus.nombre,
                    periodo_desc: c_periods.descripcion, id_nivel: c_level.id_nivel, carrera_nombre: c_career.nombre,
                    concentracion: s_rec.concentracion, madalidad: c_level.descripcion, f_turno_remoto: turno.f_turno_remoto, semaforo: "N/A"}

      end
    end

    render "sidi_bd/v1/turno/show"

  end

end