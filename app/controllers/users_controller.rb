class UsersController < ApplicationController
  def sign_in
    if session[:user_id]
      redirect_to training_path
    end

    @users = User.all
    @user = User.new
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def log_in
    @user = User.find(params[:existing_user][:user_id])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
