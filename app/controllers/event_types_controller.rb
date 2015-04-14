class EventTypesController < ApplicationController

  def index
    @event_types = EventType.all
    respond_to do |format|
      format.json { render json: @event_types }
    end
  end

  def create
    @event_type = EventType.new(event_type_params)

    respond_to do |format|
      if @event_type.save
        format.json { render json: @event_type, status: 200 }
      else
        format.json { render json: @event_type.errors.full_messages, status: 400 }
      end
    end
  end

  def update
    @event_type = EventType.find(params[:id])
    respond_to do |format|
      if @event_type.update_attributes(event_type_params)
        format.json { render json: @event_type, status: 200 }
      else
        format.json { render json: @event_type.errors.full_messages, status: 400 }
      end
    end
  end

  private

  def event_type_params
    params.require(:event_type).permit(:name, :scope_id)
  end

end
