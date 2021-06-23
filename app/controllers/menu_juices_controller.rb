# frozen_string_literal: true

# MEnuJuiceController
class MenuJuicesController < ApplicationController
  before_action :set_menu_juice, only: %i[show edit update destroy]
  # GET /menu_juices or /menu_juices.json
  def index
    @menu_juices = MenuJuice.all
  end

  # GET /menu_juices/1 or /menu_juices/1.json
  def show; end

  # GET /menu_juices/new
  def new
    @menu_juice = MenuJuice.new
  end

  # GET /menu_juices/1/edit
  def edit; end

  # POST /menu_juices or /menu_juices.json
  def create
    @menu_juice = MenuJuice.new(menu_juice_params)

    respond_to do |format|
      if @menu_juice.save
        format.html { redirect_to @menu_juice, notice: "MenuJuice was successfully created." }
        format.json { render :show, status: :created, location: @menu_juice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_juice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_juices/1 or /menu_juices/1.json
  def update
    respond_to do |format|
      if @menu_juice.update(menu_juice_params)
        format.html { redirect_to @menu_juice, notice: "MenuJuice was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_juice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_juice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_juices/1 or /menu_juices/1.json
  def destroy
    @menu_juice.destroy
    respond_to do |format|
      format.html { redirect_to menu_juice_url, notice: "MenuJuice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menu_juice
    @menu_juice = MenuJuice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def menu_juice_params
    params.require(:menu_juice).permit(:name, :cup_size, :price)
  end
end
