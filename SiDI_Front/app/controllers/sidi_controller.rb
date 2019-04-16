class SidiController < ApplicationController

  def login
    token = session[:token]
    unless token.nil?
      reset_session
    end
  end

  def acceso

    alumno = HTTParty.post("#{API_HOST_URL}#{VER}/login/getAccess",{
        :body => { :matricula => params[:matricula],
                   :password => params[:password],
                   :ip => params[:ip],
                   :navegador => params[:navegador],
                   :token_app => TOKEN }
    })

    unless alumno.nil?

      obj = JSON.parse(alumno.body)
      token = obj["token"]

      periodos = HTTParty.post("#{API_HOST_URL}#{VER}/periodos/getPeriodos",{
          :body => { :token => token,
                     :token_app => TOKEN }
      })

      unless periodos.nil?

        objPeri = JSON.parse(periodos.body)
        dataPeri = objPeri["data"]
        tokenPeri = objPeri["token"]
        count = dataPeri.count

        if count>1

          render "sidi/login"

        else
          dataPar = dataPeri["0"]
          getTurno(dataPar["id_periodo"],tokenPeri,dataPar["id_campus"])

        end

      end

    end
  end

  def inicio

  end

  def horario

  end

  def turno

    turno = HTTParty.post("#{API_HOST_URL}#{VER}/turno/getTurno",{
        :body => { :periodo => params[:periodo],
                   :token => params[:token],
                   :codigo_campus => params[:campus],
                   :token_app => TOKEN }
    })

    unless turno.nil?

      objTurn = JSON.parse(turno.body)
      tokenTurn = objTurn["token"]
      alumnTurn = objTurn["data"]

      unless alumnTurn.nil?

        x = "#{alumnTurn["nombre"]} #{alumnTurn["apellido_paterno"]}"

        if alumnTurn["f_turno_remoto"] == "N/A"

          session[:token] = tokenTurn
          session[:matricula] = alumnTurn["matricula"]
          session[:nombre] = x
          session[:periodo] = alumnTurn["periodo_desc"]
          session[:campus] = alumnTurn["campus"]
          session[:nivel] = alumnTurn["nivel"]
          session[:carrera] = alumnTurn["carrera_nombre"]
          session[:concentracion] = alumnTurn["concentracion"]
          session[:modalidad] = alumnTurn["modalidad"]
          @sem = alumnTurn["semaforo"]

          render "sidi/inicio"

        else

          session[:turno] = alumnTurn["f_turno_remoto"]
          session[:token] = tokenTurn
          session[:matricula] = alumnTurn["matricula"]
          session[:nombre] = x
          session[:periodo] = alumnTurn["periodo_desc"]
          session[:campus] = alumnTurn["campus"]
          session[:nivel] = alumnTurn["nivel"]
          session[:carrera] = alumnTurn["carrera_nombre"]
          session[:concentracion] = alumnTurn["concentracion"]
          session[:modalidad] = alumnTurn["modalidad"]

          render "sidi/turno"

        end
      else

          @error = "Tu cuenta no parece estar activa, favor de verificar"
          render "sidi/login"

      end
    else
      @error = "No se encontro informacion del alumno"
      render "sidi/login"
    end

  end

  def getTurno(periodo,token,campus)

    turno = HTTParty.post("#{API_HOST_URL}#{VER}/turno/getTurno",{
        :body => { :periodo => periodo,
                   :token => token,
                   :codigo_campus => campus,
                   :token_app => TOKEN }
    })

    unless turno.nil?

      objTurn = JSON.parse(turno.body)
      tokenTurn = objTurn["token"]
      alumnTurn = objTurn["data"]

      unless alumnTurn.nil?

        x = "#{alumnTurn["nombre"]} #{alumnTurn["apellido_paterno"]}"

        if alumnTurn["f_turno_remoto"] == "N/A"

          session[:token] = tokenTurn
          session[:matricula] = alumnTurn["matricula"]
          session[:nombre] = x
          session[:periodo] = alumnTurn["periodo_desc"]
          session[:campus] = alumnTurn["campus"]
          session[:nivel] = alumnTurn["nivel"]
          session[:carrera] = alumnTurn["carrera_nombre"]
          session[:concentracion] = alumnTurn["concentracion"]
          session[:modalidad] = alumnTurn["modalidad"]
          @sem = alumnTurn["semaforo"]

          render "sidi/inicio"

        else

          session[:turno] = alumnTurn["f_turno_remoto"]
          session[:token] = tokenTurn
          session[:matricula] = alumnTurn["matricula"]
          session[:nombre] = x
          session[:periodo] = alumnTurn["periodo_desc"]
          session[:campus] = alumnTurn["campus"]
          session[:nivel] = alumnTurn["nivel"]
          session[:carrera] = alumnTurn["carrera_nombre"]
          session[:concentracion] = alumnTurn["concentracion"]
          session[:modalidad] = alumnTurn["modalidad"]

          render "sidi/turno"

        end
      else
          @error = "Tu cuenta no parece estar activa, favor de verificar"
          render "sidi/login"
      end
    else
      @error = "No se encontro informacion del alumno"
      render "sidi/login"
    end

  end

  def salida

    reset_session

    render "sidi/login"

  end

end