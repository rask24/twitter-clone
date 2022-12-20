class TweetsController < ApplicationController
  before_action :to_home, except: [:show, :create, :destroy]
  before_action :require_login, only: [:show]

  def index
    @tweets = Tweet.all
  end

  def show
    @tweets = Tweet.all
    @tweet = Tweet.new
    @user = current_user
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = session[:user_id]
    if tweet.save
      redirect_to home_path
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to home_path, status: :see_other
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
