# frozen_string_literal: true

class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!

  protected

  def require_admin
    redirect_to(root_path, alert: 'You are not authorized to access this page') and return unless current_user.admin?
  end
end
