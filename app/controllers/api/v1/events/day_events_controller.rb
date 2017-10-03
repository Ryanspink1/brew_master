class Api::V1::Events::DayEventsController < ApplicationController

  def index
    render json: Event.day_events
  end

end
