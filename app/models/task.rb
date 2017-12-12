class Task < ActiveRecord::Base
  belongs_to :task_frequency
  has_many :active_tasks, dependent: :destroy
  belongs_to :user
  belongs_to :category
  validates :user_id, :target, :date, presence: true
  scope :today_tasks, ->(user, date) { ActiveRecord::Base.connection.execute("SELECT * FROM tasks WHERE (user_id = '#{user.id}') AND ((date = '#{date}') OR (frequency_id = 2) OR (frequency_id = 3 AND extract(dow from date) = '#{date.wday}') OR (frequency_id = 4 AND extract(day from date) = '#{date.day}') OR (frequency_id = 5 AND extract(day from date) = '#{date.day}' AND extract(month from date) = '#{date.month}'))")}
end
