class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    user_params = params.permit(:email_address, :password)
    logger.debug "User params: #{user_params.inspect}"

    if user = User.authenticate_by(user_params)
      start_new_session_for user
      logger.debug "Session after login: #{session[:user_id].inspect}"
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
