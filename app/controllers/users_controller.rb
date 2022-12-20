class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to home_path
    else
      render 'index'
    end
  end

  def show
    @user_tweets = Tweet.where(user_id: params[:id])
    @profile_user = User.find(params[:id])
    @user ||= User.find_by(id: session[:user_id])
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
