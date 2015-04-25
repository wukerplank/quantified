class EventTypesController < ApplicationController

  def index
    @event_types = current_user.event_types.all
    respond_to do |format|
      format.json { render json: @event_types }
    end
  end

  def create
    @event_type = current_user.event_types.build(event_type_params)

    respond_to do |format|
      if @event_type.save
        format.json { render json: @event_type, status: 200 }
      else
        format.json { render json: @event_type.errors.full_messages, status: 400 }
      end
    end
  end

  def update
    @event_type = current_user.event_types.find(params[:id])
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
