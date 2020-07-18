class ChangeDataManagerNumberToAdministrators < ActiveRecord::Migration[6.0]
  def change
    change_column :administrators, :manager_number, "integer USING CAST('manager_number AS integer')"
  end
end
