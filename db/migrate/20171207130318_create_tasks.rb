class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :target
      t.date :date
      t.belongs_to :frequency, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
