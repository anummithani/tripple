class TripPhotosController < ApplicationController
  before_action :set_trip_photo, only: [:show, :edit, :update, :destroy]

  # GET /trip_photos
  def index
    @trip_photos = TripPhoto.all
  end

  # GET /trip_photos/1
  def show
  end

  # GET /trip_photos/new
  def new
    @trip_photo = TripPhoto.new
  end

  # GET /trip_photos/1/edit
  def edit
  end

  # POST /trip_photos
  def create
    @trip_photo = TripPhoto.new(trip_photo_params)

    if @trip_photo.save
      redirect_to @trip_photo, notice: 'Trip photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trip_photos/1
  def update
    if @trip_photo.update(trip_photo_params)
      redirect_to @trip_photo, notice: 'Trip photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trip_photos/1
  def destroy
    @trip_photo.destroy
    redirect_to trip_photos_url, notice: 'Trip photo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_photo
      @trip_photo = TripPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_photo_params
      params.require(:trip_photo).permit(:image, :caption, :trip_id, :uploading_user_id)
    end
end
