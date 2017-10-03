class Api::V1::Events::NewEventsController < ApplicationController

  def index
    render json: Event.new_events
  end
end
