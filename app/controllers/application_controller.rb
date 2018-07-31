class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  
  def current_user
    if session[:owner_id]
      @owner = Owner.find(session[:owner_id])
    else
    end
  end

  # For future use MVP: see my pets only
  def authorized
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

end
