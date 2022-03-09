class SightsController < ApplicationController
  before_action :set_sight, only: [:show, :edit, :update, :destroy]

  # GET /sights
  def index
    @sights = Sight.all
  end

  # GET /sights/1
  def show
  end

  # GET /sights/new
  def new
    @sight = Sight.new
  end

  # GET /sights/1/edit
  def edit
  end

  # POST /sights
  def create
    @sight = Sight.new(sight_params)

    if @sight.save
      message = 'Sight was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @sight, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /sights/1
  def update
    if @sight.update(sight_params)
      redirect_to @sight, notice: 'Sight was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sights/1
  def destroy
    @sight.destroy
    message = "Sight was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to sights_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sight
      @sight = Sight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sight_params
      params.require(:sight).permit(:name, :date, :time, :trip_id)
    end
end
