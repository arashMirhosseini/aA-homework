class SessionsController < ApplicationController
  
  before_action :require_current_user!, except: [:create, :new]
  
  def new 
    render :new 
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user.nil?
      flash.now[:errors] = "Credentials were wrong"
      render :new
    else
      log_in!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
end