class CreateClefs < ActiveRecord::Migration
  def change
    create_table :clefs do |t|
      t.string :sign
      t.integer :line
      t.integer :measure_id
      t.timestamps
    end
  end
end
