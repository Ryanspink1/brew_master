class Api::V1::BreweriesController <ApplicationController

  def index
    render json: Brewery.get_breweries
  end

  def show
    render json: Brewery.get_brewery(params[:id])
  end
end
