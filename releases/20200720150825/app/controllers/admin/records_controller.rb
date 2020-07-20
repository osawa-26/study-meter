class Admin::RecordsController < Admin::Base
  before_action :authorize

  def index
    if params[:app_user_id]
      @app_user = AppUser.find(params[:app_user_id])
      @records = @app_user.records
    else
      @records = Record
    end
      @records = @records.order(created_at: :desc).page(params[:page])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.assign_attributes(record_params)
    if @record.save
      flash[:success] = '正常に入力されました'
      redirect_to :admin_app_users
    else
      flash.now[:danger] = '正常に入力されませんでした'
      render action: "edit"
    end
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy!
    flash[:success] = "削除されました"
    # redirect_to :admin_app_users
    redirect_to :admin_app_users
  end

  private def record_params
    params.require(:record).permit(
      :material,
      :study_date,
      :study_hour,
      :study_minute,
      :memo,
    )
  end
end
