class User::SessionsController < User::Base
  skip_before_action :authorize

  def new
    if current_app_user
      redirect_to :user_root
    else
      @form = User::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = User::LoginForm.new(login_form_params)
    if @form.email.present?
      app_user =
        AppUser.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if User::Authenticator.new(app_user).authenticate(@form.password)
      if app_user.suspended?
        flash.now[:danger] = "アカウントが停止されています。"
        render action: "new"
      else
        session[:app_user_id] = app_user.id
        session[:last_access_time] = Time.current
        flash[:success] = "ログインしました！！"
        redirect_to :user_root
      end
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません。"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:user_login_form).permit(:email, :password)
  end

  def destroy
    session.delete(:app_user_id)
    flash[:success] = "ログアウトしました。"
    redirect_to :user_root
  end
end
