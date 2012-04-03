class ScheduleStop < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :stop
end
