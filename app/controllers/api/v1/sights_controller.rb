class Api::V1::SightsController < Api::V1::GraphitiController
  def index
    sights = SightResource.all(params)
    respond_with(sights)
  end

  def show
    sight = SightResource.find(params)
    respond_with(sight)
  end

  def create
    sight = SightResource.build(params)

    if sight.save
      render jsonapi: sight, status: 201
    else
      render jsonapi_errors: sight
    end
  end

  def update
    sight = SightResource.find(params)

    if sight.update_attributes
      render jsonapi: sight
    else
      render jsonapi_errors: sight
    end
  end

  def destroy
    sight = SightResource.find(params)

    if sight.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sight
    end
  end
end
