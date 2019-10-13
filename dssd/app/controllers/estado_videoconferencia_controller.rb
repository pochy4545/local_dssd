class EstadoVideoconferenciaController < ApplicationController
  before_action :set_estado_videoconferencium, only: [:show, :edit, :update, :destroy]

  # GET /estado_videoconferencia
  # GET /estado_videoconferencia.json
  def index
    @estado_videoconferencia = EstadoVideoconferencium.all
  end

  # GET /estado_videoconferencia/1
  # GET /estado_videoconferencia/1.json
  def show
  end

  # GET /estado_videoconferencia/new
  def new
    @estado_videoconferencium = EstadoVideoconferencium.new
  end

  # GET /estado_videoconferencia/1/edit
  def edit
  end

  # POST /estado_videoconferencia
  # POST /estado_videoconferencia.json
  def create
    @estado_videoconferencium = EstadoVideoconferencium.new(estado_videoconferencium_params)

    respond_to do |format|
      if @estado_videoconferencium.save
        format.html { redirect_to @estado_videoconferencium, notice: 'Estado videoconferencium was successfully created.' }
        format.json { render :show, status: :created, location: @estado_videoconferencium }
      else
        format.html { render :new }
        format.json { render json: @estado_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_videoconferencia/1
  # PATCH/PUT /estado_videoconferencia/1.json
  def update
    respond_to do |format|
      if @estado_videoconferencium.update(estado_videoconferencium_params)
        format.html { redirect_to @estado_videoconferencium, notice: 'Estado videoconferencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_videoconferencium }
      else
        format.html { render :edit }
        format.json { render json: @estado_videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_videoconferencia/1
  # DELETE /estado_videoconferencia/1.json
  def destroy
    @estado_videoconferencium.destroy
    respond_to do |format|
      format.html { redirect_to estado_videoconferencia_url, notice: 'Estado videoconferencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_videoconferencium
      @estado_videoconferencium = EstadoVideoconferencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_videoconferencium_params
      params.require(:estado_videoconferencium).permit(:estado)
    end
end
