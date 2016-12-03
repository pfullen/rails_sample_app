class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]
  #before_action :correct_user, only: :destroy
  # GET /infos
  # GET /infos.json
  def index
    @infos = Info.all
  end

  # GET /infos/1
  # GET /infos/1.json
  def show
  end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # POST /infos
  # POST /infos.json
  def create
      @user = current_user
      @info = Info.create(info_params)
      @user.info = @info
      #@info = current_user.Info.build(info_params)
      #@info = infos.build(info_params)
      #@info = @user.build_info(info_params)
      #@use
      # @info = Info.build(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to @info, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @info }
      else
        format.html { render :new }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infos/1
  # PATCH/PUT /infos/1.json
  def update
    @user = current_user
    respond_to do |format|
      if current_user.info.update(info_params)
        format.html { redirect_to root_url , notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @info }
      else
        format.html { render :edit }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infos/1
  # DELETE /infos/1.json
  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @user = current_user
      #@info = Info.find(id: params[:id])
      #@user.info = @info
    end

    def correct_user
    
    @info = current_user.infos.find_by(id: params[:id])
    redirect_to new_info_path if @info.nil?
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def info_params
      params.require(:info).permit(:first_name, :last_name, :middle_name, :date_of_birth, :street_address, :city, :state, :zip_code, :phone, :cell_phone, :wife_name, :wife_date_of_birth, :wedding_anniversary, :diocese_of_ordination, :ordination_date, :diocese_of_incardination, :incardination_date, :military_service, :faculties, :preaching, :status, :employer, :employer_address, :secondary_address, :secondary_city, :string, :secondary_state, :secondary_zip, :secondary_phone, :assignment, :assignment_location, :assignment_pastor, :emergency_contact_name, :emergency_contract_phone, :user_id)
    end
end
