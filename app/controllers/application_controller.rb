class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def respond_ok
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def current_user
    @current_user ||= Dj.find(session[:dj_id]) if session[:dj_id]
  end
  helper_method :current_user

  def require_current_user
    unless current_user
      flash[:error] = "Sorry, you have to login to access that page"
      redirect_to login_path
    end
  end

end
