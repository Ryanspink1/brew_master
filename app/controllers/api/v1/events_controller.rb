class Api::V1::EventsController <ApplicationController

  def show
    render json: Event.get_event(event_params)
  end

  private

  def event_params
    params.permit(:id)
  end
end
