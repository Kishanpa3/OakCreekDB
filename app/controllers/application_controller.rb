class ApplicationController < ActionController::Base
  WEBrick::HTTPUtils.const_set("MAX_URI_LENGTH", 10240)
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :update_form_partial
end
