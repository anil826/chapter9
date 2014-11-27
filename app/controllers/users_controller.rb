class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.where(id: params[:id]).take
    logger.info "-------------------#{@user.inspect}"
  end

  def create
    @user = User.new(user_params) #Not the final implementation
    if @user.save
      flash[:success] = "Welcome to my Test Application"
      redirect_to @user

    else
      render 'new'
    end
  end

  def edit
     @user = User.where(id: params[:id]).take
  end

  def update
    @user = User.where(id: params[:id]).take
    if @user.update_attributes(user_params)
      flash[:success] = "Update Successfull"
      redirect_to @user
    else
      render 'edit'
    end
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
