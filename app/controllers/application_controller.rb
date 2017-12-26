class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def get_user
    @user ||= current_user
  end

  def prepare_exception_notifier
    #...
  end

  def determine_layout
    current_user.nil? ? "login" : "dashboard"
  end
end
