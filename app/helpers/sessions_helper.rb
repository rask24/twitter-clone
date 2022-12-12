module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    redirect_to login_path if !logged_in?
  end

  def to_home
    redirect_to home_path if logged_in?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
