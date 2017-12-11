class CreateTaskFrequencies < ActiveRecord::Migration
  def change
    create_table :task_frequencies do |t|
      t.string :frequency

      t.timestamps null: false
    end
  end
end
