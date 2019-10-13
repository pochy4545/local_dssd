class RegistroVideoconferenciaController < ApplicationController
  before_action :set_registro_videoconferencium, only: [:show, :edit, :update, :destroy]

  # GET /registro_videoconferencia
  # GET /registro_videoconferencia.json
  def index
    @registro_videoconferencia = RegistroVideoconferencium.all
  end

  # GET /registro_videoconferencia/1
  # GET /registro_videoconferencia/1.json
  def show
  end

  # GET /registro_videoconferencia/new
  def new
    @registro_videoconferencium = RegistroVideoconferencium.new
  end

  # GET /registro_videoconferencia/1/edit
  def edit
  end

  # POST /registro_videoconferencia
  # POST /registro_videoconferencia.json
  def create
    @registro_videoconferencium = RegistroVideoconferencium.new(registro_videoconferencium_params)

    respond_to do |format|
      if @registro_videoconferencium.save
        format.html { redirect_to @registro_videoconferencium, notice: 'Registro videoconferencium was successfully created.' }
        format.json { render :show, status: :created, location: @registro_videoconferencium }
      else
        format.html { render :new }
        format.json { render json: @registro_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registro_videoconferencia/1
  # PATCH/PUT /registro_videoconferencia/1.json
  def update
    respond_to do |format|
      if @registro_videoconferencium.update(registro_videoconferencium_params)
        format.html { redirect_to @registro_videoconferencium, notice: 'Registro videoconferencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @registro_videoconferencium }
      else
        format.html { render :edit }
        format.json { render json: @registro_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_videoconferencia/1
  # DELETE /registro_videoconferencia/1.json
  def destroy
    @registro_videoconferencium.destroy
    respond_to do |format|
      format.html { redirect_to registro_videoconferencia_url, notice: 'Registro videoconferencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro_videoconferencium
      @registro_videoconferencium = RegistroVideoconferencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_videoconferencium_params
      params.require(:registro_videoconferencium).permit(:estado, :fecha, :hora, :descripcion, :videoconferencia)
    end
end
