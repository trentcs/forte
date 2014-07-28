class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :score_id
      t.string :instrument_name
      t.timestamps
    end
  end
end

