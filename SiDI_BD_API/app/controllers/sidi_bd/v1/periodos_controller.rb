class SidiBd::V1::PeriodosController < ApplicationController

  def getPeriodos

    @token = params[:token]

    unless @token.nil?

      id_student = TokenAlumnos.find_by("token = ?",@token)

      record = Alumnos.where("matricula = ?", id_student.matricula)

        @periodos = Hash.new
        countNumber = 0
        record.each{ |i|
          @periodos["#{countNumber}"] = Periodos.find_by("id_periodo = ? and id_campus= ? and b_esta_activo = true", i.id_periodo, i.id_campus)
          countNumber+=1
        }

    end


    render "sidi_bd/v1/periodos/show"


  end

end