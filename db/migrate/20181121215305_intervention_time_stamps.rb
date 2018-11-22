class InterventionTimeStamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :interventions, null: true
  end
end
