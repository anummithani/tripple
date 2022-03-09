class Api::V1::TravelersController < Api::V1::GraphitiController
  def index
    travelers = TravelerResource.all(params)
    respond_with(travelers)
  end

  def show
    traveler = TravelerResource.find(params)
    respond_with(traveler)
  end

  def create
    traveler = TravelerResource.build(params)

    if traveler.save
      render jsonapi: traveler, status: :created
    else
      render jsonapi_errors: traveler
    end
  end

  def update
    traveler = TravelerResource.find(params)

    if traveler.update_attributes
      render jsonapi: traveler
    else
      render jsonapi_errors: traveler
    end
  end

  def destroy
    traveler = TravelerResource.find(params)

    if traveler.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: traveler
    end
  end
end
