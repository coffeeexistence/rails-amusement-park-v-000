class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?
  private

    def admin?
      current_user.admin if logged_in?
    end

  	def logged_in?
  		session.has_key?(:user_id) ? User.exists?(session[:user_id]) : false
  	end

  	def current_user
  		User.find(session[:user_id])
  	end
end
