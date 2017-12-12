class Task < ActiveRecord::Base
  belongs_to :task_frequency
  has_many :active_tasks, dependent: :destroy
  belongs_to :user
  belongs_to :category
  validates :user_id, :target, :date, presence: true
  scope :today_tasks, ->(user, date) { ActiveRecord::Base.connection.execute("SELECT * FROM tasks WHERE (user_id = '#{user.id}') AND ((date = '#{date}') OR (frequency_id = 2) OR (frequency_id = 3 AND to_number(date, 'W') = '#{date.wday}') OR (frequency_id = 4 AND cast(strftime('%d',date) as real) = '#{date.day}') OR (frequency_id = 5 AND to_number(date, 'DD') = '#{date.day}' AND to_number(date, 'MM') = '#{date.month}'))")}
end
