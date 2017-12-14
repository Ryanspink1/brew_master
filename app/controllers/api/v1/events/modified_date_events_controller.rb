class Api::V1::Events::ModifiedDateEventsController < ApplicationController

  def index
    render json: Event.modified_date_events(date_data[:date])
  end

  private
  
  def date_data
    params.permit(:date)
  end
end
