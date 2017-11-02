class Api::V1::Events::BreweryEventsController < ApplicationController

  def index
    render json: Brewery.get_events(brewery_data[:id])
  end

  private

  def brewery_data
    params.permit(:id)
  end
end
