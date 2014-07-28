class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :step
      t.integer :alter
      t.integer :octave
      t.integer :note_id
      t.timestamps
    end
  end
end