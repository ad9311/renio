class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern
  before_action :track_navigation_history

  private

  def track_navigation_history
    return unless user_signed_in?

    session[:navigation_history] ||= []
    session[:navigation_history] << request.path if request.path != session[:navigation_history].last
    session[:navigation_history].shift if session[:navigation_history].size > 10
  end
end
