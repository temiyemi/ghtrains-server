class Ticket < ActiveRecord::Base
  belongs_to :customer
  belongs_to :schedule

  validates_presence_of :schedule_id, :customer_id, on: :create

  before_create do
    self.number = Time.now.to_i
    # self.status = 'new'
    self.amount = 1.00
  end

  default_scope order: 'tickets.created_at DESC'
end
