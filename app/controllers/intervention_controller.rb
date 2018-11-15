class InterventionController < ApplicationController

    before_action :authenticate_user!

    def intervention_index
        puts "____________________________________________________________"
    end

    def list_buildings_by_customers
        puts params[:selected_customer]
        @listed_buildings = Building.where(customer_id: params[:selected_customer])
        puts @listed_buildings
        render "intervention/intervention.js.erb"
    end

    def list_batteries_by_buildings
        puts params[:selected_building]
        @listed_batteries = Battery.where(building_id: params[:selected_building])
        puts @listed_batteries
        render "intervention/batteries.js.erb"
    end
    
    def list_columns_by_batteries
        puts params[:selected_battery]
        @listed_columns = Column.where(battery_id: params[:selected_battery])
        puts @listed_columns
        render "intervention/columns.js.erb"
    end

    def list_elevators_by_columns
        puts params[:selected_column]
        @listed_elevators = Elevator.where(column_id: params[:selected_column])
        puts @listed_elevators
        render "intervention/elevators.js.erb"
    end

    def new_intervention
        @intervention_post = Intervention.new(params[:intervention].permit!)
        @intervention_post.author = current_user.employee
        @intervention_post.save! 
        redirect_to :intervention
    end

end
