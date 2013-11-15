class ApplicationController < ActionController::Base
  protect_from_forgery

  include ETM::LocaleController

  include ApplicationHelper

end
