class User::Base < ApplicationController
  private def current_app_user
    if session[:app_user_id]
      @current_app_user ||=
        app_user.find_by(id: session[:app_user_id])
    end
  end

  helper_method :current_app_user
end
