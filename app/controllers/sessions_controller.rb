class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:session][:email].downcase).take
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == 1 ? remember(user) : forget(user)
      redirect_to user
    else
      flash[:danger]= "Invalid / User Name and Password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    reset_session
    redirect_to root_path
  end
end
