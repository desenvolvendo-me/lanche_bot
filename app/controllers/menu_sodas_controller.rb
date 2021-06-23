# frozen_string_literal: true

# controller to menu sodas
class MenuSodasController < ApplicationController
  before_action :set_menu_soda, only: %i[show edit update destroy]

  # GET /menu_sodas or /menu_sodas.json
  def index
    @menu_sodas = MenuSoda.all
  end

  # GET /menu_sodas/1 or /menu_sodas/1.json
  def show; end

  # GET /menu_sodas/new
  def new
    @menu_soda = MenuSoda.new
  end

  # GET /menu_sodas/1/edit
  def edit; end

  # POST /menu_sodas or /menu_sodas.json
  def create
    @menu_soda = MenuSoda.new(menu_soda_params)

    respond_to do |format|
      if @menu_soda.save
        format.html { redirect_to @menu_soda, notice: "Menu soda was successfully created." }
        format.json { render :show, status: :created, location: @menu_soda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_soda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_sodas/1 or /menu_sodas/1.json
  def update
    respond_to do |format|
      if @menu_soda.update(menu_soda_params)
        format.html { redirect_to @menu_soda, notice: "Menu soda was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_soda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_soda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_sodas/1 or /menu_sodas/1.json
  def destroy
    @menu_soda.destroy
    respond_to do |format|
      format.html { redirect_to menu_sodas_url, notice: "Menu soda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menu_soda
    @menu_soda = MenuSoda.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def menu_soda_params
    params.require(:menu_soda).permit(:name, :type, :price)
  end
end
