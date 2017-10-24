class Api::V1::UserEventsController <ApplicationController

  def index
    render json: current_user.event_index
  end

  def create
    UserEvent.create_entry(current_user, params)
  end

  def destroy
    UserEvent.delete_entry(current_user, params)
  end
end
