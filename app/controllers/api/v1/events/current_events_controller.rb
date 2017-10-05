class Api::V1::Events::CurrentEventsController < ApplicationController

  def index
    render json: Event.current_events
  end
end
