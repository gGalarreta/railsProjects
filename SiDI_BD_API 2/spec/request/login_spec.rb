require 'rails_helper'


RSpec.describe SidiBd::V1::LoginController, type: :request do

  describe "POST /login" do

    it "responds with a 200 code " do
        auth = {matricula: "A123456", ip: "127.0.0.1", navegador: "Chrome"}
        post "/sidi_bd/v1/login/authorize" , {auth: auth}
        have_http_status(200)
    end

  end

end