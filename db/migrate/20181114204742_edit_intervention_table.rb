class EditInterventionTable < ActiveRecord::Migration[5.2]
  def change
    change_column :interventions, :author, :string
    add_column :interventions, :employee_id, :integer
  end
end
