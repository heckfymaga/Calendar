module TasksHelper
  def get_frequently(task)
    TaskFrequency.find(task['frequency_id']).frequency
  end
end
