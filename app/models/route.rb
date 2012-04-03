class Route < ActiveRecord::Base
  has_many :schedules
  has_many :schedule_stops, through: :schedules
end
