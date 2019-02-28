class UsersController < ApplicationController

  before_action :only_current_user, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      log_in!(@user)
      # render json: @user
      redirect_to bands_url
    else
      render json: "nope"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user.email
  end

  private
  def user_params
    params.require("user").permit(:email, :password)
  end
end
