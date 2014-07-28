class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :number
      t.integer :divisions
      t.integer :part_id
      t.timestamps
    end
  end
end
