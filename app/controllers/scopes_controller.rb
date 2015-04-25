class ScopesController < ApplicationController

  respond_to :json

  def index
    @scopes = Scope.all

    respond_with @scopes
  end

  def create
    @scope = Scope.new(scope_params)

    respond_to do |format|
      if @scope.save
        respond_with @scope
      else
        respond_with @scope.errors.full_messages, status: 400
      end
    end
  end

  def update
    @scope = Scope.find(params[:id])

    respond_to do |format|
      if @scope.update_attributes(scope_params)
        respond_with @scope, status: 200
      else
        respond_with @scope.errors.full_messages, status: 400
      end
    end
  end

  private

  def scope_params
    params.require(:scope).permit(:name)
  end

end
