class SidiApi::V1::TurnoController < ApplicationController

  def getTurno

    token = params[:token]
    periodo = params[:periodo]
    codigo_c = params[:codigo_campus]

    if token.nil? || periodo.nil? || codigo_c.nil?

      @msgs = {info: "Los campos o uno de los viene vacio", status: :unauthorized}
      @error = {info: "Campos vacios", status: :unauthorized}

    else

      turno = HTTParty.post("#{BD_HOST_URL}#{VER}/turno/getTurno",{
          :body => { :token => token,
                     :periodo => periodo,
                     :codigo_campus => codigo_c,
                     :my_token => TOKEN}
      })

        unless turno.nil?
          obj = JSON.parse(turno.body)
          @data = obj["data"]
          @token = obj["token"]
        else
          @msgs = {info: "Posible error entre WS, verificar", status: :unauthorized}
          @error = {info: "Error de comunicacion", status: :unauthorized}
        end

    end

    render "sidi_api/v1/turno/show"

  end

end