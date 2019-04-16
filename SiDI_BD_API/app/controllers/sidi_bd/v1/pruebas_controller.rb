class SidiBd::V1::PruebasController < ApplicationController

  def insert

    @resp = "Error no se pudo guardar"

    qryPrueba = CModalidades.new(id_modalidad: "24", descripcion: "Esto es una prueba")
    #qryPrueba = Alumnos.new(matricula: "A00000001", apellido_paterno: "Lopez", apellido_materno: "Vazquez", n_pidm: "000001", ruta_fotografia: "http://www.facebook.com/goku", sexo: "M", f_nacimiento_alumno: "12/07/1954", f_ingreso: "12/03/2017", nombre: "Alejandro")

    if qryPrueba.save

      @resp = qryPrueba

    end

    render "sidi_bd/v1/pruebas/show"

  end

  def read

    @resp = "Error no se pudo leer"

    qryPrueba = Alumnos.all

    unless qryPrueba.nil?

      @resp = qryPrueba

    end

    render "sidi_bd/v1/pruebas/show"
  end

  def update

    @resp = "Error no se pudo actualizar"

    alumno = CModalidades.find("24").update(descripcion: "Esto no es una prueba")
    #alumno = Alumnos.find(['Lopez','A00000001','Vazquez']).update(apellido_paterno: "Perez")

    unless alumno.nil?

      @resp = alumno

    end

    render "sidi_bd/v1/pruebas/show"
  end

  def delete

    @resp = "Error no se pudo eliminar"

    if Alumnos.find(['Perez','A00000001','Vazquez']).destroy
      @resp = "Alumno Eliminado"
    end
    render "sidi_bd/v1/pruebas/show"
  end


end

