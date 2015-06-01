class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :show]
  before_action :admin_user,     only: [:new, :create, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trips = Trip.all
    @maps = Map.where('trip_id = ?', @trip.id)
    # @locations = Location.where(:id => @maps.map(&:location_id))
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)


    user_ids =  params[:trip][:users_attributes]

    puts user_ids
    if not user_ids.nil?
      user_ids.keys().each do |k|
        user = User.find(user_ids[k]["id"])
        @trip.users << user if user_ids[k]["_destroy"] != "1" and not @trip.users.include? user
      end
    end


    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, flash: {success: "Trip was successfully created." } }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update

    user_ids =  params[:trip][:users_attributes]
    @trip.users.delete_all()

    if not user_ids.nil?
      user_ids.keys().each do |k|
        puts "-------------------------------- HERE -----"
        puts user_ids[k]["id"]
        if not user_ids[k]["id"].empty?
        user = User.find(user_ids[k]["id"])
        @trip.users << user if ((user_ids[k]["_destroy"] != "1") and (not @trip.users.include? user))
          end
    
      end
    end


    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, flash: {success: "Trip was successfully updated." } }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, flash: {success: "Trip was successfully deleted." } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:trip_name, :start_date, :end_date, :trip_notes, :users_attributes)
    end
end
