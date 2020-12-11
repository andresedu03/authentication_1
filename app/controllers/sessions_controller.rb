class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user.present? && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
        redirect_to root_path
    else
      render :new
      end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
