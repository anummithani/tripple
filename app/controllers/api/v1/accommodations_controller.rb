class Api::V1::AccommodationsController < Api::V1::GraphitiController
  def index
    accommodations = AccommodationResource.all(params)
    respond_with(accommodations)
  end

  def show
    accommodation = AccommodationResource.find(params)
    respond_with(accommodation)
  end

  def create
    accommodation = AccommodationResource.build(params)

    if accommodation.save
      render jsonapi: accommodation, status: :created
    else
      render jsonapi_errors: accommodation
    end
  end

  def update
    accommodation = AccommodationResource.find(params)

    if accommodation.update_attributes
      render jsonapi: accommodation
    else
      render jsonapi_errors: accommodation
    end
  end

  def destroy
    accommodation = AccommodationResource.find(params)

    if accommodation.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: accommodation
    end
  end
end
