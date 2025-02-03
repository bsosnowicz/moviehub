class RegisterController < ApplicationController
 allow_unauthenticated_access
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User succesfully registered!'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end

  def redirect_if_logged_in
    redirect_to root_path if user_signed_in?
  end
end
