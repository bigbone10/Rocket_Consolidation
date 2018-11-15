class Elevator < ApplicationRecord
  before_update :slack_notifier
  before_save :twilio_notifier

  def model_enum
    [['Standard', 0],['Premium',1],['Excelium',2]]
  end

  def status_enum
    [['Active'],['Inactive'],['Alarm']]
  end

  def building_type_enum
    [['Residential', 0],['Commercial',1],['Corporate',2],['Hybrid',3]]
  end
  
  belongs_to :column
  

  def twilio_notifier
    account_sid = "#{ENV["account_sid"]}"
    auth_token = "#{ENV["auth_token"]}"
    @client = Twilio::REST::Client.new account_sid, auth_token

    if (self.status_was != self.status) and self.status == "Alarm" then 
    @client.api.account.messages.create(
      from: "+15817058274",
      to: self.column.battery.building.technician_phone,
      body: "Elevator #{self.id} with Serial Number #{self.serial_number} require maintenance.")
    end
  end

  def slack_notifier
    require 'date'
    current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
    notifier = Slack::Notifier.new ENV["Slack_API"]
    notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{current_time}."
  end

  
end