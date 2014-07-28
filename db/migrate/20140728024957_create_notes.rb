class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.boolean :rest
      t.integer :duration
      t.integer :type
      t.integer :stem
      t.boolean :chord
      t.integer :measure_id

      t.timestamps
    end
  end
end
