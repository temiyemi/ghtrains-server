class Feedback < ActiveRecord::Base
  belongs_to :customer
  belongs_to :staff
  before_create do
    #self.status = 'new'
    self.staff_id = 1
    #self.feedback = 0
  end

  default_scope order: 'feedbacks.created_at DESC'
end
