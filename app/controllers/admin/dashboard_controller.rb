class Admin::DashboardController < ApplicationController
  # Ensure admin access only
  http_basic_authenticate_with :name => ENV["USERNAME"], :password => ENV["PASSWORD"]

  def show
  end
end
