class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :login_required
  helper_method :logged_in?
  add_flash_types :success, :danger

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to before_login_path unless current_user
  end

  def logged_in?
    !current_user.nil?
  end
end
