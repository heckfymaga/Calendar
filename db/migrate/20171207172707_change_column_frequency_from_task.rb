class ChangeColumnFrequencyFromTask < ActiveRecord::Migration
  def change
    change_column_default :tasks, :frequency_id,1
  end
end
