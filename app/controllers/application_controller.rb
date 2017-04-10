class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_user
    @user = current_user
  end
end
