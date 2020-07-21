class User::AccountsController < User::Base
  def show
    @app_user = current_app_user
  end

  def edit
    @app_user = current_app_user
  end

  def update
    @app_user = current_app_user
    @app_user.assign_attributes(app_user_params)
    if @app_user.save
      flash[:success] = "アカウントを更新しました。"
      redirect_to :user_account
    else
      flash[:danger] = "入力に誤りがあります。"
      render action: "edit"
    end
  end

  private def app_user_params
    params.require(:app_user).permit(
      :email,
      :family_name,
      :given_name,
      :family_name_kana,
      :given_name_kana,
      :nickname,
      :gender,
      :birthday,
      :prefecture,
      :target,
      :password,
      :start_date,
      :end_date,
      :suspended
    )
  end
end
