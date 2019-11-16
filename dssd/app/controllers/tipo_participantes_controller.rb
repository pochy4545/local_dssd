class TipoParticipantesController < ApplicationController
  before_action :set_tipo_participante, only: [:show, :edit, :update, :destroy]

  # GET /tipo_participantes
  # GET /tipo_participantes.json
  def index
    @tipo_participantes = TipoParticipante.all
    render json: @tipo_participantes
  end

  # GET /tipo_participantes/1
  # GET /tipo_participantes/1.json
  def show
  end

  # GET /tipo_participantes/new
  def new
    @tipo_participante = TipoParticipante.new
  end

  # GET /tipo_participantes/1/edit
  def edit
  end

  # POST /tipo_participantes
  # POST /tipo_participantes.json
  def create
    @tipo_participante = TipoParticipante.new(tipo_participante_params)

    respond_to do |format|
      if @tipo_participante.save
        format.html { redirect_to @tipo_participante, notice: 'Tipo participante was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_participante }
      else
        format.html { render :new }
        format.json { render json: @tipo_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_participantes/1
  # PATCH/PUT /tipo_participantes/1.json
  def update
    respond_to do |format|
      if @tipo_participante.update(tipo_participante_params)
        format.html { redirect_to @tipo_participante, notice: 'Tipo participante was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_participante }
      else
        format.html { render :edit }
        format.json { render json: @tipo_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_participantes/1
  # DELETE /tipo_participantes/1.json
  def destroy
    @tipo_participante.destroy
    respond_to do |format|
      format.html { redirect_to tipo_participantes_url, notice: 'Tipo participante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_participante
      @tipo_participante = TipoParticipante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_participante_params
      params.require(:tipo_participante).permit(:tipo)
    end
end
