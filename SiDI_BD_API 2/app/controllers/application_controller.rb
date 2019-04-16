class ApplicationController < ActionController::API
  #before_action :authenticate

  def authenticate
    token_app = params[:my_token]
    @varTemp = 0
    queryToken = TokenApp.find_by("token = ?", token_app)

    if queryToken.nil? || !queryToken.access

      resp = {error: "Token no autorizado", status: :unauthorized, codigo: 404}

    else

        if queryToken.expires_at <= Time.zone.now

          resp = {error: "Token caducado", status: :unauthorized, codigo: 401}

        else

          myToken = TokenApp.find_by("token = ?",TOKEN)

          arrReq = myToken.request_allowed.split(",")

          if arrReq.size > 1

            arrReq.each do |i|

              if queryToken.cod_app == i
                @varTemp = 1
              end

            end

          else

            if queryToken.cod_app == myToken.request_allowed
              @varTemp = 1
            end

          end

          if @varTemp == 1
            # Lineas para mandar al log
            #resp = {msg: "Aplicacion autorizada", status: :authorized}
          else

            resp = {error: "Aplicacion no autorizada", status: :unauthorized, codigo: 401}

          end

        end

    end

    if @varTemp == 0
      render json: resp
    end

  end

end
