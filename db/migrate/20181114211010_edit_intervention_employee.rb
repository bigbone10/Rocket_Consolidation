class EditInterventionEmployee < ActiveRecord::Migration[5.2]
  def change
    change_column :interventions, :employee_id, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
