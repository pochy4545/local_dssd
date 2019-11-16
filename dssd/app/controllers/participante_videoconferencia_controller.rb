class ParticipanteVideoconferenciaController < ApplicationController
  before_action :set_participante_videoconferencium, only: [:show, :edit, :update, :destroy]

  # GET /participante_videoconferencia
  # GET /participante_videoconferencia.json
  def index
    @participante_videoconferencia = ParticipanteVideoconferencium.all
    render json: @participante_videoconferencia
  end

  # GET /participante_videoconferencia/1
  # GET /participante_videoconferencia/1.json
  def show
  end

  # GET /participante_videoconferencia/new
  def new
    @participante_videoconferencium = ParticipanteVideoconferencium.new
  end

  # GET /participante_videoconferencia/1/edit
  def edit
  end

  # POST /participante_videoconferencia
  # POST /participante_videoconferencia.json
  def create
    @participante_videoconferencium = ParticipanteVideoconferencium.new(participante_videoconferencium_params)

    respond_to do |format|
      if @participante_videoconferencium.save
        format.html { redirect_to @participante_videoconferencium, notice: 'Participante videoconferencium was successfully created.' }
        format.json { render :show, status: :created, location: @participante_videoconferencium }
      else
        format.html { render :new }
        format.json { render json: @participante_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participante_videoconferencia/1
  # PATCH/PUT /participante_videoconferencia/1.json
  def update
    respond_to do |format|
      if @participante_videoconferencium.update(participante_videoconferencium_params)
        format.html { redirect_to @participante_videoconferencium, notice: 'Participante videoconferencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @participante_videoconferencium }
      else
        format.html { render :edit }
        format.json { render json: @participante_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participante_videoconferencia/1
  # DELETE /participante_videoconferencia/1.json
  def destroy
    @participante_videoconferencium.destroy
    respond_to do |format|
      format.html { redirect_to participante_videoconferencia_url, notice: 'Participante videoconferencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participante_videoconferencium
      @participante_videoconferencium = ParticipanteVideoconferencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participante_videoconferencium_params
      params.require(:participante_videoconferencium).permit(:tipo_participante, :apellido, :nombres, :email)
    end
end
