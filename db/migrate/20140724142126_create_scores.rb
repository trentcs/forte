class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.string :title
      t.string :composer
      t.boolean :is_public
      t.string :original_image
      t.string :sound_clip
      t.string :music_xml

      t.timestamps
    end
  end
end
