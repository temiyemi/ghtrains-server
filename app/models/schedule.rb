class Schedule < ActiveRecord::Base
  belongs_to :route
  belongs_to :train
  has_many :tickets
  has_many :schedule_stops
  has_many :stops, through: :schedule_stops
end
