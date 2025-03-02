class ApplicationController < ActionController::Base
  include Authentication
  before_action do
    logger.debug "Current session: #{session.to_hash.inspect}"
  end
  helper_method :user_signed_in?, :current_user

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  allow_browser versions: :modern
end
