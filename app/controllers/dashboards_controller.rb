class DashboardsController < ApplicationController
  def show
    @buyers = User.where(role: "buyer")
    # raise
  end
end
