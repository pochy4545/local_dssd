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
