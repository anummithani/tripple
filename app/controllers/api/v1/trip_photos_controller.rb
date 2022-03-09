class Api::V1::TripPhotosController < Api::V1::GraphitiController
  def index
    trip_photos = TripPhotoResource.all(params)
    respond_with(trip_photos)
  end

  def show
    trip_photo = TripPhotoResource.find(params)
    respond_with(trip_photo)
  end

  def create
    trip_photo = TripPhotoResource.build(params)

    if trip_photo.save
      render jsonapi: trip_photo, status: 201
    else
      render jsonapi_errors: trip_photo
    end
  end

  def update
    trip_photo = TripPhotoResource.find(params)

    if trip_photo.update_attributes
      render jsonapi: trip_photo
    else
      render jsonapi_errors: trip_photo
    end
  end

  def destroy
    trip_photo = TripPhotoResource.find(params)

    if trip_photo.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: trip_photo
    end
  end
end
