class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Pagy::Backend

  def logged_in_user
    return if logged_in?

    flash[:danger] = "Please log in."
    redirect_to login_path
  end
end
