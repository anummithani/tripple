class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: %i[show edit update destroy]

  def index
    @q = Accommodation.ransack(params[:q])
    @accommodations = @q.result(distinct: true).includes(:trip).page(params[:page]).per(10)
  end

  def show; end

  def new
    @accommodation = Accommodation.new
  end

  def edit; end

  def create
    @accommodation = Accommodation.new(accommodation_params)

    if @accommodation.save
      message = "Accommodation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @accommodation, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation,
                  notice: "Accommodation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @accommodation.destroy
    message = "Accommodation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to accommodations_url, notice: message
    end
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def accommodation_params
    params.require(:accommodation).permit(:name, :check_in_date,
                                          :check_out_date, :trip_id)
  end
end
