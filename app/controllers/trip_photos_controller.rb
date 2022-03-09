class TripPhotosController < ApplicationController
  before_action :set_trip_photo, only: %i[show edit update destroy]

  # GET /trip_photos
  def index
    @q = TripPhoto.ransack(params[:q])
    @trip_photos = @q.result(distinct: true).includes(:uploading_user,
                                                      :trip).page(params[:page]).per(10)
  end

  # GET /trip_photos/1
  def show; end

  # GET /trip_photos/new
  def new
    @trip_photo = TripPhoto.new
  end

  # GET /trip_photos/1/edit
  def edit; end

  # POST /trip_photos
  def create
    @trip_photo = TripPhoto.new(trip_photo_params)

    if @trip_photo.save
      message = "TripPhoto was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @trip_photo, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /trip_photos/1
  def update
    if @trip_photo.update(trip_photo_params)
      redirect_to @trip_photo, notice: "Trip photo was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /trip_photos/1
  def destroy
    @trip_photo.destroy
    message = "TripPhoto was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to trip_photos_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip_photo
    @trip_photo = TripPhoto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trip_photo_params
    params.require(:trip_photo).permit(:image, :caption, :trip_id,
                                       :uploading_user_id)
  end
end
