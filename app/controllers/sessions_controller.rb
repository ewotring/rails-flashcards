class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      @errors = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

end