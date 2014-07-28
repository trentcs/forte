class CreateMeasureTimes < ActiveRecord::Migration
  def change
    create_table :measure_times do |t|
      t.integer :beats
      t.integer :beat_type
      t.integer :measure_id
      t.timestamps
    end
  end
end
