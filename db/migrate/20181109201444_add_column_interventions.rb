class AddColumnInterventions < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :intervention_result, :string
    add_column :interventions, :intervention_report, :text
    add_column :interventions, :intervention_status, :string
  end
end
