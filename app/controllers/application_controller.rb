class ApplicationController < ActionController::Base
  protect_from_forgery

  include ETM::LocaleController

  include ApplicationHelper

  rescue_from ActionController::UnknownFormat do
    head :not_acceptable
  end
end
