class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :score_id
      t.string :instrument_name
      t.integer :part_number
      t.timestamps
    end
  end
end

