class SidiBd::V1::TokenAppController < ApplicationController

  def access
    token_pet = params[:token_pet]
    token_app = params[:my_token]
    @varPet = 0
    queryToken = TokenApps.find_by("token = ?", token_pet)

    if queryToken.nil? || !queryToken.b_acceso

      resp = {error: "Token no autorizado #{queryToken}", status: :unauthorized, codigo: 404}

    else

        if queryToken.f_expiracion <= Time.zone.now

          resp = {error: "Token caducado", status: :unauthorized, codigo: 401}

        else

          tokApp = TokenApps.find_by("token = ?",token_app)

          arrReq = tokApp.autorizaciones.split(",")

          if arrReq.size > 1

            arrReq.each do |i|
              if queryToken.id_app == i
                @varPet = 1
              end
            end

          else

            if queryToken.autorizaciones == tokApp.id_app
              @varPet = 1
            end

          end

          if @varPet == 1
            # Lineas para mandar al log
            resp = {msg: "Aplicacion de peticion autorizada", status: :authorized, codigo: 200}
          else

            resp = {error: "Aplicacion de peticion no autorizada", status: :unauthorized, codigo: 401}

          end

        end

    end

    render json: resp


  end

end