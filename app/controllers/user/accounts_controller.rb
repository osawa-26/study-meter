class User::AccountsController < User::Base
  skip_before_action :authorize, only: [ :new, :create ]

  def show
    @app_user = current_app_user
  end

  def new
    @app_user = AppUser.new
  end

  def edit
    @app_user = current_app_user
  end

  def create
        # binding.pry
    @app_user = AppUser.new
    @app_user.assign_attributes(app_user_params)
    if @app_user.save!
      flash[:success] = "アカウントを新規登録しました。ログインお願いします。"
      redirect_to :user_login
    else
      flash[:danger] = "入力に誤りがあります。"
      render action: "new"
    end
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
      :password_confirmation,
      :start_date,
      :end_date,
      :suspended,
    )
  end
end
