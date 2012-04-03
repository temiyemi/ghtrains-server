class Feedback < ActiveRecord::Base
  belongs_to :customer
  belongs_to :staff
end
