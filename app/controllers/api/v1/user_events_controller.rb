class Api::V1::UserEventsController <ApplicationController

  def index
    render json: current_user.event_index
  end

  def create
    UserEvent.create_entry(current_user,event_params)
  end

  def destroy
    UserEvent.delete_entry(current_user, event_params)
  end

  private

  def event_params
    params.permit(:event_id)
  end
end
