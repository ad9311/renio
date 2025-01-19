class DashboardsController < ApplicationController
  def index
    @summary = Wallets::Summary.call(user: current_user).summary
  end
end
