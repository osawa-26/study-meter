class Admin::SessionsController < Admin::Base
  skip_before_action :authorize

  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(login_form_params)
    if @form.manager_number.present?
      administrator =
        Administrator.find_by("manager_number = ?", @form.manager_number)
    end
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      if administrator.suspended?
        flash.now[:danger] = "アカウントが停止されています。"
        render action: "new"
      else
        session[:administrator_id] = administrator.id
        session[:admin_last_access_time] = Time.current
        flash[:success] = "ログインしました！！"
        redirect_to :admin_root
      end
    else
      flash.now[:danger] = "管理者番号またはパスワードが正しくありません。"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:admin_login_form).permit(:manager_number, :password)
  end

  def destroy
    session.delete(:administrator_id)
    flash[:success] = "ログアウトしました。"
    redirect_to :admin_root
  end
end
