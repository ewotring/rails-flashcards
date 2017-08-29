module ApplicationHelper

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_id
    current_user.id if current_user
  end

  def logged_in?
    !!current_user
  end
end
