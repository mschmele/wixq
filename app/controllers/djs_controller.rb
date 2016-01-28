class DjsController < ApplicationController
  def index
    @djs = Dj.all
  end

  def login
    @dj = Dj.new
  end

  def edit
    @dj = Dj.find(params[:id])
    if @dj != current_user
      flash[:error] = "You can't edit another DJ!"
      redirect_to root_path
      return
    end
  end

  def update
    @dj = Dj.find(params[:id])
    if !@dj.authenticate(dj_params[:current_password])
      flash[:error] = "Incorrect password!"
      render 'edit'
      return
    end
    if @dj.update_attributes(
        first_name: dj_params[:first_name],
        last_name: dj_params[:last_name],
        password: dj_params[:new_password],
        password_confirmation: dj_params[:password_confirmation],
        is_default_password: false
      )
      flash[:success] = "Successfully updated your profile!"
      redirect_to live_path
    else
      render 'edit'
    end
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
    redirect_to root_path
  end

  private

  def dj_params
    params.require(:dj).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :new_password,
      :password_confirmation,
      :current_password
    )
  end

end
