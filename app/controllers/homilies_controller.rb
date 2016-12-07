class HomiliesController < ApplicationController
  before_action :set_homily, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
   
     
  # GET /homilies
  # GET /homilies.json
  def index
    @homilies = Homily.all
  end

  # GET /homilies/1
  # GET /homilies/1.json
  def show
  end

  # GET /homilies/new
  def new
    @homily = Homily.new
  end

  # GET /homilies/1/edit
  def edit
  end

  # POST /homilies
  # POST /homilies.json
  def create
    @homily = current_user.homilies.build(homily_params)

    respond_to do |format|
      if @homily.save
        format.html { redirect_to @homily, notice: 'Homily was successfully created.' }
        format.json { render :show, status: :created, location: @homily }
      else
        format.html { render :new }
        format.json { render json: @homily.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homilies/1
  # PATCH/PUT /homilies/1.json
  def update
    respond_to do |format|
      if @homily.update(homily_params)
        
        format.html { redirect_to @homily, notice: 'Homily was successfully updated.' }
        format.json { render :show, status: :ok, location: @homily }
      else
        format.html { render :edit }
        format.json { render json: @homily.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homilies/1
  # DELETE /homilies/1.json
  def destroy
    @homily.destroy
    respond_to do |format|
      format.html { redirect_to homilies_url, notice: 'Homily was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homily
      
      @homily = current_user.homilies.find_by(id: params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homily_params
      params.require(:homily).permit(:date, :subject, :week, :time, :cycle, 
      :first_reading_book, :first_reading_chapter, :first_reading_verse, 
      :second_reading_book, :second_reading_chapter, :second_reading_verse,
      :gospel_book, :gospel_chapter, :gospel_verse, :homily_text, :user_id)
    end
end
