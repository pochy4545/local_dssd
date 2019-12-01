require 'uri'
require 'net/http'

class VideoconferenciaController < ApplicationController
  before_action :set_videoconferencium, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /videoconferencia
  # GET /videoconferencia.json
  def index
    @videoconferencias = Videoconferencium.all
    render json: @videoconferencias
  end

  # GET /videoconferencia/1
  # GET /videoconferencia/1.json
  def show
  end

  # GET /videoconferencia/new
  def new
    @videoconferencium = Videoconferencium.new
  end

  # GET /videoconferencia/1/edit
  def edit
  end
  
  def getHoraYfechaDeVideoconferencia
    @videoconferencium = Videoconferencium.find(params[:id])
    render json: @videoconferencium
  end
  # POST /videoconferencia
  # POST /videoconferencia.json
  def create
    @videoconferencium = Videoconferencium.new(videoconferencium_params)

    respond_to do |format|
      if @videoconferencium.save
        format.html { redirect_to @videoconferencium, notice: 'Videoconferencium was successfully created.' }
        format.json { render :show, status: :created, location: @videoconferencium }
      else
        format.html { render :new }
        format.json { render json: @videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videoconferencia/1
  # PATCH/PUT /videoconferencia/1.json
  def update
    respond_to do |format|
      if @videoconferencium.update(videoconferencium_params)
        format.html { redirect_to @videoconferencium, notice: 'Videoconferencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @videoconferencium }
      else
        format.html { render :edit }
        format.json { render json: @videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videoconferencia/1
  # DELETE /videoconferencia/1.json
  def destroy
    @videoconferencium.destroy
    respond_to do |format|
      format.html { redirect_to videoconferencia_url, notice: 'Videoconferencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def fechas
    puts params       
    @test= HTTParty.post( "https://dssdcloud1.herokuapp.com/disponibilidad", 
   :body => {:dni => params[:dni],:hash => params[:hash],  :idRol => params[:idRol],  :fecha => params[:fecha],:hora => params[:hora], :id_unidad => params[:id_unidad]}.to_json, 
   :headers => {'Content-Type' => 'application/json'})
   render json: @test
 end

 def autenticar
  
  #aharrar usuario de la sesion de bonita
  #@result = HTTParty.get( "http://localhost:8080/bonita/API/system/session/unuserid")
  @result = HTTParty.post( "http://localhost:8080/bonita/loginservice",
    :body => {:username => "agustin", :password => "123", :redirect => false},
    :headers => {'Content-Type' => 'application/x-www-form-urlencoded'})
    puts("cokkiessssss")
    puts(@result.headers["set-cookie"])
    @jesonId = @result.headers["set-cookie"].gsub("JSESSIONID="," ").gsub(";"," ").split(" ")[1]
    puts("json id")
    puts(@jesonId)
    @response = { token: @result.headers["set-cookie"].gsub("X-Bonita-API-Token="," ").gsub(";"," ").split(" ")[4] , jsonId: @jesonId}
    render  json: @response
 end

 def confirmarVideoconferencia
  @tipo
  if(params[:tipoParticipante] == 3)
    @tipoVideoconferencia = 1
  else 
    @tipoVideoconferencia = 2
  end
  @data = params[:data]
  @participantes = params[:dataP]
  @videoconferencium = Videoconferencium.new()
  @videoconferencium.fecha = @data['fecha']
  @videoconferencium.hora = @data['hora']
  @videoconferencium.unidad = @data['unidad']
  @videoconferencium.estado = 9
  @videoconferencium.tipo = @tipoVideoconferencia
  @videoconferencium.nro_causa = @data['numeroCausa']
  @videoconferencium.motivo = @data['motivo']
  @videoconferencium.solicitante = 2
  @id=""
  if @videoconferencium.save
      @id = @videoconferencium.id
      puts("videoconferencia guardada")
  else
     puts("error al guardar videoconferencia")
  end

  if (@id != "")
    @participantes.each{|participante| 
        @r= Relation.new()
        @r.videoconferencia_id = @id
        @r.participante_videoconferencia_id = participante
        if @r.save
           puts("participante guardado")
           @userMail = ParticipanteVideoconferencium.find(participante).email
           if(@userMail != nil) 
              UserMailer.with(user: @userMail).enviar.deliver_now
              puts("se envio correctamente el mail")
           end
        else
           puts("eeror al guardar participantes para la videoconferencia :"+ @id)
        end
    }
  else
    puts("error al obtener el id de la videoconferencia")
  end

  render json: @id
 end

 def avanzarTask
  @id = params[:idTask]
  @token = params[:token]
  @jsonId = params[:jsonId]
  puts("token ///////")
  puts(@token)
  puts("id")
  puts(@id)
  puts("json id")
  puts(@jsonId)
  url = URI("http://localhost:8080/bonita/API/bpm/userTask/"+@id+"/execution")
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url)
  request["X-Bonita-API-Token"] = @token
  request["Accept"] = '*/*'
  request["Cache-Control"] = 'no-cache'
  request["Host"] = 'localhost:8080'
  request["Accept-Encoding"] = 'gzip, deflate'
  request["Cookie"] = "X-Bonita-API-Token="+@token
  request["Cookie"] =request["Cookie"] + "; JSESSIONID="+@jsonId
  request["Content-Length"] = '0'
  request["Connection"] = 'keep-alive'
  request["cache-control"] = 'no-cache'
  response = http.request(request)
  puts("ok")
  puts(response.to_hash)
  render json: response
 end

 def iniciarVideoconferencia
  @videoconferencium = Videoconferencium.find(params[:idUnidad])
  time_diff = (Time.current - @videoconferencium.hora.to_time)
  estado = 9
  if ((time_diff / 1.minute).round > 10) 
       estado = 2
  else 
       estado = 1
  end
  @registro= RegistroVideoconferencium.new()
  @registro.estado = estado
  @videoconferencium.estado = estado
  if @videoconferencium.save
    puts("se cambio el estado correctamente")
  else
    puts("error al cambiar el estado")
  end
  @registro.fecha = DateTime.now.strftime("%d/%m/%Y")
  @registro.hora = Time.now.strftime("%I:%M:%S")
  @registro.descripcion = "videoconferencia iniciada"
  @registro.videoconferencia = params[:idUnidad]
  @registro.horaFin = Time.now.strftime("%I:%M:%S")
  if @registro.save
      puts("se cambio el estado de la videoconferencia correctamente")
  else
     puts("error al cambiar el estado de la videoconferencia")
  end
  render json: @registro
 end
 
 
 def cancelarVideoconferencia
  @videoconferencium = Videoconferencium.find(params[:idUnidad])
  @videoconferencium.estado = 4
  if @videoconferencium.save
    puts("se cambio el estado correctamente")
  else
    puts("error al cambiar el estado")
  end
  @registro= RegistroVideoconferencium.new()
  @registro.estado = 4
  @registro.fecha = DateTime.now.strftime("%d/%m/%Y")
  @registro.hora = Time.now.strftime("%I:%M:%S")
  @registro.descripcion = "videoconferencia cancelada"
  @registro.videoconferencia = params[:idUnidad]
  @registro.horaFin = Time.now.strftime("%I:%M:%S")
  if @registro.save
    puts("se cambio el estado de la videoconferencia correctamente")
  else
     puts("error al cambiar el estado de la videoconferencia")
  end
  render json: @registro
 end

 def finalizarVideoconferencia
  @videoconferencium = Videoconferencium.find(params[:idUnidad])
  @estado = params[:estado]
  @videoconferencium.estado = @estado["estado"]
  if @videoconferencium.save
    puts("se cambio el estado correctamente")
  else
    puts("error al cambiar el estado")
  end
  @registro= RegistroVideoconferencium.new()
  @registro.estado = @estado["estado"]
  @registro.fecha = DateTime.now.strftime("%d/%m/%Y")
  @registro.hora = Time.now.strftime("%I:%M:%S")
  @registro.descripcion = "videoconferencia finalizada"
  @registro.videoconferencia = params[:idUnidad]
  @registro.horaFin = Time.now.strftime("%I:%M:%S")
  if @registro.save
    puts("se cambio el estado de la videoconferencia correctamente")
  else
     puts("error al cambiar el estado de la videoconferencia")
  end
  render json: @registro
 end
 
 def getInfoDelUsuario
    @id = params[:idTask]
    @token = params[:token]
    @jsonId = params[:jsonId]
    url = URI("http://localhost:8080/bonita/API/system/session/unusedId")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Accept"] = '*/*'
    request["Cache-Control"] = 'no-cache'
    request["Host"] = 'localhost:8080'
    request["Accept-Encoding"] = 'gzip, deflate'
    request["Cookie"] = "X-Bonita-API-Token="+@token
    request["Cookie"] =request["Cookie"] + "; JSESSIONID="+@jsonId
    request["Connection"] = 'keep-alive'
    request["cache-control"] = 'no-cache'
    response = http.request(request)
    render json: response.read_body
 end

 def enviarMail
    UserMailer.with(user: "agustin.c.96@hotmail.com").enviar.deliver_now
    render json: "ok"
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videoconferencium
      @videoconferencium = Videoconferencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def videoconferencium_params
      params.require(:videoconferencium).permit(:fecha, :hora, :unidad, :estado, :tipo, :nro_causa, :motivo, :solicitante)
    end

    
end
