class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.boolean :rest
      t.integer :duration
      t.string :note_type
      t.integer :stem
      t.boolean :chord
      t.string :voice
      t.integer :alter
      t.string :sci_notation
      t.integer :measure_id

      t.timestamps
    end
  end
end
