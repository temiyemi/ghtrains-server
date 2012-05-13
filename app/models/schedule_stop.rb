class ScheduleStop < ActiveRecord::Base
  belongs_to :schedule, inverse_of: :schedule_stops
  belongs_to :stop

  #attr_accessor :name
end
