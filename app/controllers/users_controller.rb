class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to home_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
