class ApplicationController < ActionController::API

  include ActionController::RespondWith
  include ActionController::ImplicitRender

  before_action :authenticate_user!

end
