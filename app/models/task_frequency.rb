class TaskFrequency < ActiveRecord::Base
  has_many :tasks
  validates :frequency, presence: true
end
