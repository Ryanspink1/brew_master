class Api::V1::BreweriesController <ApplicationController

  def index
    render json: Brewery.get_breweries
  end

  def show
    render json: Brewery.get_brewery(brewery_data[:id])
  end

  private

  def brewery_data
    params.permit(:id)
  end
end
