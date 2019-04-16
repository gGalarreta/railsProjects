class SidiBd::V1::LoginController < ApplicationController

  before_action :generate_token

  def authorize
    matri = params[:matricula]
    ip = params[:ip]
    nav = params[:navegador]

    @student = Personas.find_by("id_persona = ?", matri)
    @session = Sesiones.new
    @tokenStu = TokenAlumnos.new


    unless @student.nil?

      idAlumno = @student.id_persona

      unless ip.nil?
        @session.direccion_ip = ip
      end

      unless nav.nil?
        @session.informacion_cliente = nav
      end

      unless ip.nil? || nav.nil?
        @session.id_persona = matri
        @session.tipo_usuario = matri[0,1]
        @session.n_acceso = 1
        @session.f_ultima_sesion = Date.today.to_s
        @session.save
      end

      @resTok = TokenAlumnos.find_by("matricula = ? ", idAlumno )

        @tokenStu.f_expiracion = @expires_at
        @tokenStu.token =  @token
        @tokenStu.matricula = idAlumno
        @tokenStu.save
        @token_student = @token

    else
      @msgs = {info: "Revise sus datos ingresados", status: :unauthorized }
      @error = {info: "El alumno no esta registrado", status: :unauthorized}
    end

    render "sidi_bd/v1/login/show"

  end

  def is_valid?
    DateTime.now < self.expires_at
  end

  private

  def generate_token
    begin
      @token = SecureRandom.hex
    end while TokenAlumnos.where(token: @token).any?
    @expires_at = 1.day.from_now
  end

  def tokenStudent_params
    @params.require(:token_student).permit(:expires_at,:token,:students_id)
  end

end