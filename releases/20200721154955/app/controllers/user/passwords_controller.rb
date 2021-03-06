class User::PasswordsController < User::Base
  def show
    redirect_to :edit_user_password
  end

  def edit
    @change_password_form =
      User::ChangePasswordForm.new(object: current_app_user)
  end

  def update
    @change_password_form = User::ChangePasswordForm.new(app_user_params)
    @change_password_form.object = current_app_user
    if @change_password_form.save
      flash.notice = "パスワードを変更しました。"
      redirect_to :user_account
    else
      flash.now.alert = "入力に誤りがあります。"
      render action: "edit"
    end
  end

  private def app_user_params
    params.require(:user_change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end
end
