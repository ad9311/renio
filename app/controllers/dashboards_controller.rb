class DashboardsController < ApplicationController
  def index
    @summary = Wallets::Summary.call(user: current_user)
  end
end
