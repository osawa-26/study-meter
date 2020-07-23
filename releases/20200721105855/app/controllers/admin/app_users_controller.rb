class Admin::AppUsersController < Admin::Base
  def index
    @app_users = AppUser.order(:family_name_kana, :given_name_kana).page(params[:page])
  end

  def show
    app_user = AppUser.find(params[:id])
    redirect_to [ :edit, :admin, app_user ]
  end

  # def new
  #   @app_user = AppUser.new
  # end

  def edit
    @app_user = AppUser.find(params[:id])
  end

  def create
    @app_user = AppUser.new(app_user_params)
    if @app_user.save
      flash[:success] = "アカウントを新規登録しました。"
      redirect_to :admin_app_users
    else
      flash[:danger] = "入力に誤りがあります。"
      render action: "new"
    end
  end

  def update
    @app_user = AppUser.find(params[:id])
    @app_user.assign_attributes(app_user_params)
    if @app_user.save
      flash[:success] = "アカウントを更新しました。"
      redirect_to :admin_app_users
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

  def destroy
    app_user = AppUser.find(params[:id])
    app_user.destroy!
    flash[:success] = "アカウントを削除しました。"
    redirect_to :admin_app_users
  end
end
