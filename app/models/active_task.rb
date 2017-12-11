class ActiveTask < ActiveRecord::Base
  belongs_to :task
  validates :task_id, :date, presence: true
end