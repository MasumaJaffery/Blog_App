class ApplicationController < ActionController::Base
  # Add current_user Method Here!
  def current_user
    @user = User.first
  end
end
