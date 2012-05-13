class Route < ActiveRecord::Base
  has_many :schedules
  has_many :schedule_stops, through: :schedules
  has_many :stops, through: :schedule_stops

  #attr_accessor :scheduled_trips


end
