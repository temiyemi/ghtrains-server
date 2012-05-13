class Customer < ActiveRecord::Base
  has_many :feedbacks
  has_many :tickets

  before_create do
    self.app_key = "%x".upcase % Time.now.to_i
  end

end
