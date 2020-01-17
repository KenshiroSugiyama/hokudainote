class CreateNoteImages < ActiveRecord::Migration[5.2]
  def change
    create_table :note_images do |t|
      t.references :note, foreign_key: true
      t.integer :sequence
      t.timestamps
    end
  end
end
