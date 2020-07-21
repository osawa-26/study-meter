class User::ToppagesController < User::Base
  def index
    @records = current_app_user.records
    @records_today = @records.where(study_date: Time.current)
    @records_this_week = @records.where(study_date: Time.current.in_time_zone.all_week)
    @records_this_month = @records.where(study_date: Time.current.in_time_zone.all_month)

    @total_time = @records.total_minutes(:study_minute) + @records.total_hours(:study_hour) * 60
    @today_total_time = @records_today.total_minutes(:study_minute) + @records_today.total_hours(:study_hour) * 60
    @this_week_total_time = @records_this_week.total_minutes(:study_minute) + @records_this_week.total_hours(:study_hour) * 60
    @this_month_total_time = @records_this_month.total_minutes(:study_minute) + @records_this_month.total_hours(:study_hour) * 60
  end
end
