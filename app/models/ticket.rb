class Ticket < ActiveRecord::Base
  belongs_to :customer
  belongs_to :schedule
end
