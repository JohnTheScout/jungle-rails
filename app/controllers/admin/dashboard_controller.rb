class Admin::DashboardController < ApplicationController
  include AuthenticationHelper
  before_filter :authenticate
  def show
  end
end
