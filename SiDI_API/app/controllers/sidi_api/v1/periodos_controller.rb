class SidiApi::V1::PeriodosController < ApplicationController

  def getPeriodos

    token = params[:token]

    if token.nil?

      @msgs = {info: "El token viene vacio", status: :unauthorized}
      @error = {info: "Token vacio", status: :unauthorized}

    else

      periodos = HTTParty.post("#{BD_HOST_URL}#{VER}/periodos/getPeriodos",{
          :body => { :token => token,
                     :my_token => TOKEN}
      })

      unless periodos.nil?
        obj = JSON.parse(periodos.body)
        @data = obj["data"]
        @token = obj["token"]
      else
        @msgs = {info: "Posible error entre WS, verificar", status: :unauthorized}
        @error = {info: "Error de comunicacion", status: :unauthorized}
      end

    end

    render "sidi_api/v1/periodos/show"

  end
end