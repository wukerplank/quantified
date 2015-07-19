class AccessTokensController < ApplicationController

  respond_to :json

  def create
    @access_token = current_user.generate_access_token
    respond_with @access_token
  end

  def destroy
    @access_token = current_user.access_tokens.find_by_token!(params[:id])
    @access_token.destroy
    head :no_content
  end

end
