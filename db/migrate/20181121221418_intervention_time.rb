class InterventionTime < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :intervention_start, :timestamp
    add_column :interventions, :intervention_end, :timestamp
    remove_column :interventions, :created_at
    remove_column :interventions, :updated_at
  end
end
