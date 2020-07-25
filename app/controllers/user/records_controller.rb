class User::RecordsController < User::Base
  before_action :authorize

  def index
    @records = current_app_user.records.order(created_at: :desc).page(params[:page])
  end

  def show
    @record = current_app_user.record.find(record_params[:id])
    redirect_to [ :edit, :user, record ]
  end

  def new
    @record = Record.new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    # binding.pry
    @record = current_app_user.records.build(record_params)
    if @record.save
      flash[:success] = '正常に入力されました'
      redirect_to user_records_url
    else
      flash.now[:danger] = '正常に入力されませんでした'
      render action: "new"
    end
  end

  def update
    @record = Record.find(params[:id])
    @record.assign_attributes(record_params)
    if @record.save
      flash[:success] = '正常に入力されました'
      redirect_to :user_records
    else
      flash.now[:danger] = '正常に入力されませんでした'
      render action: "edit"
    end
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy!
    flash[:success] = "削除されました"
    redirect_to :user_records
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
