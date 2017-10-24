class Api::V1::BreweriesController <ApplicationController

  def index
    render json: Brewery.get_breweries
  end
end
