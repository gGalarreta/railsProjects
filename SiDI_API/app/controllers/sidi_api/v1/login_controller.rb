class SidiApi::V1::LoginController < ApplicationController

  def getAccess

    alumno = HTTParty.post("#{BD_HOST_URL}#{VER}/login/authorize",{
        :body => { :matricula => params[:matricula],
                   :ip => params[:ip],
                   :navegador => params[:navegador],
                   :my_token => TOKEN }
    })

    pass = params[:password]

    unless alumno.nil?
      obj = JSON.parse(alumno.body)
      @data = obj["data"]
      @token = obj["token"]
      @fecNac = @data["f_nacimiento"].to_datetime
      month = @fecNac.strftime("%m")
      day = @fecNac.strftime("%d")
      @password = "#{month}#{day}"
      @arrJ = {fecha: @fecNac, password: @password}
    else
      @msgs = {info: "Posible error entre WS, verificar", status: :unauthorized , codigo: 500}
      @error = {info: "Error de comunicacion", status: :unauthorized, codigo: 500}
    end

    unless  pass == @password
        @data = nil
        @error = {info: "Password incorrecto", status: :unauthorized, codigo: 401}
        @msgs = {info: "Consulte la ayuda del campus", status: :unauthorized, codigo: 401}
    end

    render "sidi_api/v1/login/show"

  end

end