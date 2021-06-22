# frozen_string_literal: true

# controller to menu
class MenuMainsController < ApplicationController
  before_action :set_menu_main, only: %i[show edit update destroy]

  # GET /menu_mains or /menu_mains.json
  def index
    @menu_mains = MenuMain.all
  end

  # GET /menu_mains/1 or /menu_mains/1.json
  def show; end

  # GET /menu_mains/new
  def new
    @menu_main = MenuMain.new
  end

  # GET /menu_mains/1/edit
  def edit; end

  # POST /menu_mains or /menu_mains.json
  def create
    @menu_main = MenuMain.new(menu_main_params)

    respond_to do |format|
      if @menu_main.save
        format.html { redirect_to @menu_main, notice: "Menu main was successfully created." }
        format.json { render :show, status: :created, location: @menu_main }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_mains/1 or /menu_mains/1.json
  def update
    respond_to do |format|
      if @menu_main.update(menu_main_params)
        format.html { redirect_to @menu_main, notice: "Menu main was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_main }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_mains/1 or /menu_mains/1.json
  def destroy
    @menu_main.destroy
    respond_to do |format|
      format.html { redirect_to menu_mains_url, notice: "Menu main was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menu_main
    @menu_main = MenuMain.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def menu_main_params
    params.require(:menu_main).permit(:name, :description, :price)
  end
end
