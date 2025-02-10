# frozen_string_literal: true

class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
end
