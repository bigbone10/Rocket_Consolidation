class CreateIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
     t.string :author
     t.integer :customer_id
     t.integer :building_id
     t.integer :battery_id
     t.integer :column_id
     t.integer :elevator_id
     t.integer :employee_id
     t.date :intervention_start
     t.date :intervention_end
    end
  end
end
