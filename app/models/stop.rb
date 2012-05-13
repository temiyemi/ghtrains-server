class Stop < ActiveRecord::Base
  has_many :schedule_stops, inverse_of: :stop
end
