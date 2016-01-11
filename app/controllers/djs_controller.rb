class DjsController < ApplicationController
  def index
    @djs = Dj.all
  end

  def login
    @dj = Dj.new
  end

  def handle_login
    dj = Dj.find_by(email: dj_params[:email])
    if dj && dj.authenticate(dj_params[:password])
      session[:dj_id] = dj.id
      redirect_to live_path
    else
      flash[:error] = "Invalid username or password"
      @dj = Dj.new(email: dj_params[:email])
      redirect_to :back
    end
  end

  def logout
    session.destroy
    flash[:success] = "Successfully logged out!"
    redirect_to :back
  end

  private

  def dj_params
    params.require(:dj).permit(:email, :password)
  end

end
