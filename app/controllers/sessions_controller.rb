class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def index
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'パスワードかメールアドレスが間違ってます。'
      render 'index'
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
