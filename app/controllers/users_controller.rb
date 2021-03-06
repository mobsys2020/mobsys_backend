class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if params[:doctor]
      @user.doctor = true
    end
    if @user.save
      redirect_to @user
      log_in @user
    else
      render 'new'
    end
  end

  def edituat
    @user = current_user
  end

  def updateuat
    @user = current_user
    @user.user_access_token = params[:uat]
    if @user.save!
      redirect_to "/"
    else
      render :edituat
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end




end
