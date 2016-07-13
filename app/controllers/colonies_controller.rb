class ColoniesController < ApplicationController
  before_action :set_colony, only: [:show, :edit, :update, :destroy]

  # GET /colonies
  # GET /colonies.json
  def index
    @colonies = Colony.all.paginate(page: params[:page], per_page: 15)
  end

  # GET /colonies/1
  # GET /colonies/1.json
  def show
  end

  # GET /colonies/new
  def new
    @colony = Colony.new
  end

  # GET /colonies/1/edit
  def edit
  end

  # POST /colonies
  # POST /colonies.json
  def create
    @colony = Colony.new(colony_params)

    respond_to do |format|
      if @colony.save
        format.html { redirect_to colonies_url, notice: 'Colony was successfully created.' }
        format.json { render :show, status: :created, location: @colony }
      else
        format.html { render :new }
        format.json { render json: @colony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colonies/1
  # PATCH/PUT /colonies/1.json
  def update
    respond_to do |format|
      if @colony.update(colony_params)
        format.html { redirect_to colonies_url, notice: 'Colony was successfully updated.' }
        format.json { render :show, status: :ok, location: @colony }
      else
        format.html { render :edit }
        format.json { render json: @colony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colonies/1
  # DELETE /colonies/1.json
  def destroy
    @colony.destroy
    respond_to do |format|
      format.html { redirect_to colonies_url, notice: 'Colony was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colony
      @colony = Colony.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colony_params
      params.require(:colony).permit(:name, :postcode, :city_id)
    end
end
