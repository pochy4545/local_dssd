class InternoUnidadsController < ApplicationController
  before_action :set_interno_unidad, only: [:show, :edit, :update, :destroy]

  # GET /interno_unidads
  # GET /interno_unidads.json
  def index
    @interno_unidads = InternoUnidad.all
  end

  # GET /interno_unidads/1
  # GET /interno_unidads/1.json
  def show
  end

  # GET /interno_unidads/new
  def new
    @interno_unidad = InternoUnidad.new
  end

  # GET /interno_unidads/1/edit
  def edit
  end

  # POST /interno_unidads
  # POST /interno_unidads.json
  def create
    @interno_unidad = InternoUnidad.new(interno_unidad_params)

    respond_to do |format|
      if @interno_unidad.save
        format.html { redirect_to @interno_unidad, notice: 'Interno unidad was successfully created.' }
        format.json { render :show, status: :created, location: @interno_unidad }
      else
        format.html { render :new }
        format.json { render json: @interno_unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interno_unidads/1
  # PATCH/PUT /interno_unidads/1.json
  def update
    respond_to do |format|
      if @interno_unidad.update(interno_unidad_params)
        format.html { redirect_to @interno_unidad, notice: 'Interno unidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @interno_unidad }
      else
        format.html { render :edit }
        format.json { render json: @interno_unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interno_unidads/1
  # DELETE /interno_unidads/1.json
  def destroy
    @interno_unidad.destroy
    respond_to do |format|
      format.html { redirect_to interno_unidads_url, notice: 'Interno unidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interno_unidad
      @interno_unidad = InternoUnidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interno_unidad_params
      params.require(:interno_unidad).permit(:apellido, :nombre, :unidad, :email_representante)
    end
end
