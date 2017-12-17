class Api::V1::FavoritesEventsController<ApplicationController

  def index
    render json: current_user.favorites_events
  end
end
