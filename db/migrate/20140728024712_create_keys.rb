class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.integer :fifths
      t.string :mode
      t.integer :measure_id
      t.timestamps
    end
  end
end
