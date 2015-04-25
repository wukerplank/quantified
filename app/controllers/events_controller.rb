class EventsController < ApplicationController

  before_filter :convert_data, only: [:create, :update]

  def index
    @events = current_user.events.all

    respond_to do |format|
      format.json { render json: @events }
    end
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.json { render json: @event, status: 200 }
      else
        format.json { render json: @event.errors.full_messages, status: 400 }
      end
    end
  end

  def update
    @event = current_user.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.json { render json: @event, status: 200 }
      else
        format.json { render json: @event.errors.full_messages, status: 400 }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_type_id, { data: [:quantity, :measure] })
  end

  def convert_data
    if params.has_key?(:event) && params[:event].has_key?(:data)
      params[:event][:data] = YAML.load(params[:event][:data])

      logger.info params[:event]
    end
  end

end
