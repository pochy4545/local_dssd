class TipoVideoconferenciaController < ApplicationController
  before_action :set_tipo_videoconferencium, only: [:show, :edit, :update, :destroy]

  # GET /tipo_videoconferencia
  # GET /tipo_videoconferencia.json
  def index
    @tipo_videoconferencia = TipoVideoconferencium.all
    render json: @tipo_videoconferencia
  end

  # GET /tipo_videoconferencia/1
  # GET /tipo_videoconferencia/1.json
  def show
  end

  # GET /tipo_videoconferencia/new
  def new
    @tipo_videoconferencium = TipoVideoconferencium.new
  end

  # GET /tipo_videoconferencia/1/edit
  def edit
  end

  # POST /tipo_videoconferencia
  # POST /tipo_videoconferencia.json
  def create
    @tipo_videoconferencium = TipoVideoconferencium.new(tipo_videoconferencium_params)

    respond_to do |format|
      if @tipo_videoconferencium.save
        format.html { redirect_to @tipo_videoconferencium, notice: 'Tipo videoconferencium was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_videoconferencium }
      else
        format.html { render :new }
        format.json { render json: @tipo_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_videoconferencia/1
  # PATCH/PUT /tipo_videoconferencia/1.json
  def update
    respond_to do |format|
      if @tipo_videoconferencium.update(tipo_videoconferencium_params)
        format.html { redirect_to @tipo_videoconferencium, notice: 'Tipo videoconferencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_videoconferencium }
      else
        format.html { render :edit }
        format.json { render json: @tipo_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_videoconferencia/1
  # DELETE /tipo_videoconferencia/1.json
  def destroy
    @tipo_videoconferencium.destroy
    respond_to do |format|
      format.html { redirect_to tipo_videoconferencia_url, notice: 'Tipo videoconferencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_videoconferencium
      @tipo_videoconferencium = TipoVideoconferencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_videoconferencium_params
      params.require(:tipo_videoconferencium).permit(:tipo)
    end
end
