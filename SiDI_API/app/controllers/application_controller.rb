class ApplicationController < ActionController::API

  before_action :authenticate

  def authenticate

      token_str = params[:token_app]

      unless token_str.nil?

        @token = HTTParty.post("#{BD_HOST_URL}#{VER}/token_app/access",{
            :body => { :token_pet => token_str ,
                       :my_token => TOKEN}
        })

        obj = JSON.parse(@token.body)
        error = obj["error"]
        status = obj["status"]
        cod = obj["codigo"]

        unless cod == 200
          render json: {error: error, status: status, codigo: cod}
        else
            #Aqui debera enviar al log que se pudo autentificar la applicacion correctamente
        end
      else
        render json: {error: "Token de aplicacion incorrecto o vacio", status: "unauthorized", codigo: 400}
      end

  end

end
