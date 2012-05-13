class Schedule < ActiveRecord::Base
  belongs_to :route
  belongs_to :train
  has_many :tickets
  has_many :schedule_stops, dependent: :destroy, inverse_of: :schedule
  #has_many :stops, through: :schedule_stops

  attr_accessible :route_id, :arrives_at, :departs_at, :train_id
  attr_accessible :schedule_stops_attributes, allow_destroy: true
  accepts_nested_attributes_for :schedule_stops, allow_destroy: true

end
