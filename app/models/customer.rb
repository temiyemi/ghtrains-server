class Customer < ActiveRecord::Base
  has_many :feedbacks
  has_many :tickets
end
