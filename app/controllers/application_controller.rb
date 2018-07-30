class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def current_user
    session[:owner_id]
  end

  def logged_in?
    !!current_user
  end

end
