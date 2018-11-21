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
        
        ticket = ZendeskAPI::Ticket.create!($client, :type => "support", :priority => "urgent",
            :subject => "AuthorID: #{@intervention_post.author.id}  CustomerID: #{@intervention_post.customer.id}",
            :comment => { :value => "**#{@intervention_post.author.name}** has filled an intervention for **#{@intervention_post.customer.name}**.
            \n \n **BuildingID:** #{@intervention_post.building.id} (#{@intervention_post.building.name})
            \n \n **BatteryID:** #{@intervention_post.battery.id}
            \n \n **ColumnID:** #{@intervention_post.column ? @intervention_post.column.id : "NONE"}
            \n \n **ElevatorID:** #{@intervention_post.elevator ? @intervention_post.elevator.id : "NONE"}
            \n \n **Assigned employee:** #{@intervention_post.employee.id} (#{@intervention_post.employee.name})
            \n \n **Task description:** #{@intervention_post.intervention_report}" }
        )

    end
end
