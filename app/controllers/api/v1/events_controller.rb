class Api::V1::EventsController <ApplicationController

  def show
    render json: Event.get_event(params)
  end
end
