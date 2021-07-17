class BussinessesController < ApplicationController
  before_action :set_bussiness, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /bussinesses or /bussinesses.json
  def index
    #lista de todos los elementos
    @bussinesses = Bussiness.all

    #filtrando con scope
    #@bussinesses = Bussiness.all_created

    #Filtrando directamente
    #@bussinesses = Bussiness.where(status:"created")

    #Filtrar por parametros
    #@bussinesses = Bussiness.by_status("created")

    #variable local (solo funciona en index)
    title = "Business List"
    #variable de clase (para imprimir en vistas)
    @title = "Business List"
    #Ver COMENTARIO 1 del index html para detalle

  end

  # GET /bussinesses/1 or /bussinesses/1.json
  def show
    #accion el cual solo muestra la informacion de un elemento (por linea)
  end

  # GET /bussinesses/new
  def new
    #el new sirve para seatear tu formulario (objeto temporal), crea una vista parcial para dar de alta un registro nuevo. No lo guarda inicialmemente, es temporal hasta que el usuario le da save.

    @bussiness = Bussiness.new
  end

  #IMPORT data from CSV
  def import
    Bussiness.import(params[:file])
    redirect_to root_url, notice: "Data Imported!"
  end




  # GET /bussinesses/1/edit
  def edit
    #Objeto temporal, 
  end

  # POST /bussinesses or /bussinesses.json
  def create
    #guardo en business parametros nuevos
    @bussiness = Bussiness.new(bussiness_params)

    respond_to do |format|
      if @bussiness.save
        format.html { redirect_to @bussiness, notice: "Bussiness was successfully created." }
        format.json { render :show, status: :created, location: @bussiness }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bussiness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bussinesses/1 or /bussinesses/1.json
  def update
    respond_to do |format|
      if @bussiness.update(bussiness_params)
        format.html { redirect_to @bussiness, notice: "Bussiness was successfully updated." }
        format.json { render :show, status: :ok, location: @bussiness }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bussiness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bussinesses/1 or /bussinesses/1.json
  def destroy
    @bussiness.destroy
    respond_to do |format|
      format.html { redirect_to bussinesses_url, notice: "Bussiness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bussiness
      @bussiness = Bussiness.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bussiness_params
      params.require(:bussiness).permit(:name, :street, :zipcode, :neighborhood, :interested, :facebook, :instagram,
        :chatbot, :system_price, :newsletter, :trans_site, :delivery, :email, :comments, :team_id)
    end
end
