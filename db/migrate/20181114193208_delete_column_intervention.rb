class DeleteColumnIntervention < ActiveRecord::Migration[5.2]
  def change
    remove_column :interventions, :employee_id
  end
end
