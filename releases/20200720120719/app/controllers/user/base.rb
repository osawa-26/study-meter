class User::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout

  private def current_app_user
    if session[:app_user_id]
      @current_app_user ||=
        AppUser.find_by(id: session[:app_user_id])
    end
  end

  helper_method :current_app_user

  private def authorize
    unless current_app_user
      flash[:danger] = "職員としてログインしてください。"
      redirect_to :user_login
    end
  end

  private def check_account
    if current_app_user && !current_app_user.active?
      session.delete(:app_user_id)
      flash[:danger] = "アカウントが無効になりました。"
      redirect_to :user_root
    end
  end

  TIMEOUT = 60.minutes

  private def check_timeout
    if current_app_user
      if session[:last_access_time] > TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:app_user_id)
        flash[:danger] = "セッションがタイムアウトしました。"
        redirect_to :user_login
      end
    end
  end
end
