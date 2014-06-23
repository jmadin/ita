class OutlinesController < ApplicationController
  before_action :set_outline, only: [:show, :edit, :update, :destroy]

  # GET /outlines
  # GET /outlines.json
  def index
    @outlines = Outline.all
  end

  # GET /outlines/1
  # GET /outlines/1.json
  def show
    @outline = Outline.find(params[:id])
    @map = Map.find(params[:map_id])
  end

  # GET /outlines/new
  def new
    @outline = Outline.new
  end

  # GET /outlines/1/edit
  def edit
    @map = Map.find(params[:map_id])
    @outline = @map.outlines.find(params[:id])
    # @coral = Coral.find(params[:coral_id])
    # @observation = @coral.observations.find(params[:id])
  end

  # POST /outlines
  # POST /outlines.json
  def create
    # @outline = Outline.new(outline_params)
    @map = Map.find(params[:map_id])
    @outline = @map.outlines.create(outline_params)

    if @outline.save
      redirect_to map_path(@map)
      flash[:success] = "Outline was successfully created."
    else
      redirect_to map_path(@map)
      flash[:danger] = "Outline was not successfully created. Type and State required."
    end
  end

  # PATCH/PUT /outlines/1
  # PATCH/PUT /outlines/1.json
  def update
    if @outline.update(outline_params)
      redirect_to map_path(@outline.map_id)
      flash[:success] = "Outline was successfully updated."
    else
      redirect_to map_path(@outline.map_id)
      flash[:danger] = "Outline was not successfully updated. Type and State required."
    end
  end

  # DELETE /outlines/1
  # DELETE /outlines/1.json
  def destroy
    @outline.destroy
    flash[:success] = "Outline was successfully destroyed."
    redirect_to map_path(@outline.map_id)      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outline
      @outline = Outline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outline_params
      params.require(:outline).permit(:map_id, :substrate_type, :substrate_state, :outline_filename, :outliner_name, :outline_flag, :outline_area, :outline_perimeter, :outline_notes, :user_id)
    end
end
