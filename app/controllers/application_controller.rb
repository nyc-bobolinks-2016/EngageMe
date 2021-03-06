class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def authorize
    redirect_to '/login' unless current_user
  end

  def current_presentation
    @presentation = Presentation.find_by(id: params[:id])
  end
  helper_method :current_presentation
end
