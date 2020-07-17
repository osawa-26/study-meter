class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :records, :app_user_id, true
  end
end
