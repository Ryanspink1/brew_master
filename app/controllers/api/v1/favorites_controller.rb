class Api::V1::FavoritesController<ApplicationController

  def index
    render json: current_user.favorite_breweries
  end
end
