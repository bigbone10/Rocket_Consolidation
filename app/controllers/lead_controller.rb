class LeadController < ApplicationController

    def index
        
    end
    
    def new_lead
        p = params["lead"].permit!
        puts "PARAMS = #{p}"
        file_attachment = p["file_attachment"]
        if file_attachment != nil
            p["file_attachment"] = file_attachment.read
            p["original_file_name"] = file_attachment.original_filename
        end
        lead = Lead.new(p)
        lead.valid?
        p lead.errors
        lead.save!
    end

end