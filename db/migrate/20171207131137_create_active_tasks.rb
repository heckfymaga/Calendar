class CreateActiveTasks < ActiveRecord::Migration
  def change
    create_table :active_tasks do |t|
      t.belongs_to :task, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
