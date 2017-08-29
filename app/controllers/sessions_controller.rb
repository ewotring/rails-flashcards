class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to decks_path
    else
      @errors = "Incorrect email or password"
      p "you failed to login"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to decks_path
  end

end