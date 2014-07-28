class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :score_id
      t.timestamps
    end
  end
end

