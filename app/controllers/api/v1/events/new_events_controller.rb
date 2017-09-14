class Api::V1::Events::NewEventsController < ApplicationController

  def new_events
    render json: Event.where(created_at: (Time.now - 24.hours)..Time.now)
  end
end
