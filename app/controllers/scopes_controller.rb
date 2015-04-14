class ScopesController < ApplicationController

  def index
    @scopes = Scope.all
    respond_to do |format|
      format.json { render json: @scopes }
    end
  end

  def create
    @scope = Scope.new(scope_params)

    respond_to do |format|
      if @scope.save
        format.json { render json: @scope, status: 200 }
      else
        format.json { render json: @scope.errors.full_messages, status: 400 }
      end
    end
  end

  def update
    @scope = Scope.find(params[:id])

    respond_to do |format|
      if @scope.update_attributes(scope_params)
        format.json { render json: @scope, status: 200 }
      else
        format.json { render json: @scope.errors.full_messages, status: 400 }
      end
    end
  end

  private

  def scope_params
    params.require(:scope).permit(:name)
  end

end
