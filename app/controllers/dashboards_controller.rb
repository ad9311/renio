# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @wallet_summary = Wallets::Summary.call(user: current_user).summary
    @last_todo = current_user.todos.last
  end
end
