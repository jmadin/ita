class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :show]
  before_action :admin_user,     only: [:new, :create, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all

    respond_to do |format|
      format.html
      format.csv { send_data @maps.to_csv }
    end    
  end

  # GET /maps/1
  # GET /maps/1.json
  def show

    if params[:trip_id]
      @maps = Map.where(:trip_id => params[:trip_id])
      @trip = Trip.find(params[:trip_id])
      @trips = Trip.all
    elsif params[:location_id]
      @maps = Map.where(:location_id => params[:location_id])
      @location = Location.find(params[:location_id])
      @locations = Location.all
    else
      @maps = Map.all
    end

    puts @maps.inspect

    @outlines = Outline.all
  end

  # GET /maps/new
  def new
    @map = Map.new

    if params[:trip_id]
      @maps = Map.where(:trip_id => params[:trip_id])
      @trip = Trip.find(params[:trip_id])
      @trips = Trip.all
    elsif params[:location_id]
      @maps = Map.where(:location_id => params[:location_id])
      @location = Location.find(params[:location_id])
      @locations = Location.all
    else
      @maps = Map.all
    end

  end

  # GET /maps/1/edit
  def edit

    if params[:trip_id]
      @maps = Map.where(:trip_id => params[:trip_id])
      @trip = Trip.find(params[:trip_id])
      @trips = Trip.all
    elsif params[:location_id]
      @maps = Map.where(:location_id => params[:location_id])
      @location = Location.find(params[:location_id])
      @locations = Location.all
    else
      @maps = Map.all
    end

  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

puts "HERE=================================="
#puts params[:location_back].value

    if @map.save
      flash[:success] = "Map was successfully created."
      if params[:trip_back]
        redirect_to trip_map_path(:trip_id => @map.trip_id, :id => @map)
      elsif params[:location_back]
        redirect_to location_map_path(:location_id => @map.location_id, :id => @map)
      else
        redirect_to maps_path
      end
    else
      flash[:danger] = @map.errors.full_messages.join(', ')
      if params[:trip_back]
        redirect_to new_trip_map_path(:trip_id => params[:trip_back])
      elsif params[:location_back]
        redirect_to new_location_map_path(:location_id => params[:location_back])
      else
        redirect_to maps_path
      end
      # render 'new'
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update

    if @map.update_attributes(map_params)
      flash[:success] = "Map updated"

      if params[:trip_back]
        redirect_to trip_map_path(:trip_id => @map.trip_id, :id => @map)
      elsif params[:location_back]
        redirect_to location_map_path(:location_id => @map.location_id, :id => @map)
      else
        redirect_to maps_path
      end

    else
      render 'edit'
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    flash[:danger] = "Map destroyed."
    # if params[:trip_back]
    #   redirect_to trip_map_path(:trip_id => @map.trip_id, :id => @map)
    # elsif params[:location_back]
    #   redirect_to location_map_path(:location_id => @map.location_id, :id => @map)
    # else
      redirect_to maps_url
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:map_name, :map_code, :latitude, :longitude, :pixel_size, :map_description, :map_date, :location_id, :trip_id)
    end
end
