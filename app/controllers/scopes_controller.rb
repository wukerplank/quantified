class ScopesController < ApplicationController

  respond_to :json

  def index
    @scopes = current_user.scopes.all

    respond_with @scopes
  end

  def create
    @scope = current_user.scopes.build(scope_params)
    @scope.save
    respond_with @scope
  end

  def update
    @scope = current_user.scopes.find(params[:id])
    @scope.update_attributes(scope_params)
    respond_with @scope
  end

  def destroy
    @scope = current_user.scopes.find(params[:id])
    @scope.destroy
    head :no_content
  end

  private

  def scope_params
    params.require(:scope).permit(:name)
  end

end
