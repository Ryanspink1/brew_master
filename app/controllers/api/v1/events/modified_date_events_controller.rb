class Api::V1::Events::ModifiedDateEventsController < ApplicationController

  def index
    render json: Event.modified_date_events(params[:date])
  end

end
