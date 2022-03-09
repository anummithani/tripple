class TravelersController < ApplicationController
  before_action :current_user_must_be_traveler_user, only: [:edit, :update, :destroy] 

  before_action :set_traveler, only: [:show, :edit, :update, :destroy]

  # GET /travelers
  def index
    @travelers = Traveler.page(params[:page]).per(10)
  end

  # GET /travelers/1
  def show
  end

  # GET /travelers/new
  def new
    @traveler = Traveler.new
  end

  # GET /travelers/1/edit
  def edit
  end

  # POST /travelers
  def create
    @traveler = Traveler.new(traveler_params)

    if @traveler.save
      message = 'Traveler was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @traveler, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /travelers/1
  def update
    if @traveler.update(traveler_params)
      redirect_to @traveler, notice: 'Traveler was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /travelers/1
  def destroy
    @traveler.destroy
    message = "Traveler was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to travelers_url, notice: message
    end
  end


  private

  def current_user_must_be_traveler_user
    set_traveler
    unless current_user == @traveler.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_traveler
      @traveler = Traveler.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def traveler_params
      params.require(:traveler).permit(:user_id, :trip_id)
    end
end
