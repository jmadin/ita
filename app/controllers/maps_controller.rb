class MapsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_map, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    @outlines = Outline.all
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)
    if @map.save
      flash[:success] = "Map was successfully created."
      redirect_to @map
    else
      render 'new'
    end
  end


  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    if @map.update_attributes(map_params)
      flash[:success] = "Map updated"
      redirect_to @map
    else
      render 'edit'
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    flash[:danger] = "Map destroyed."
    redirect_to maps_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:map_name, :map_code, :latitude, :longitude, :pixel_size, :map_description, :map_date)
    end
end
